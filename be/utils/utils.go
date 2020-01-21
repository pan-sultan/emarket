package utils

import (
	"emarket/log"
	"io"
	"mime"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"strings"
)

func DetectCType(name string, content io.ReadSeeker) (ctype string, err error) {
	defer func() {
		_, err = content.Seek(0, io.SeekStart)
	}()
	ctype = mime.TypeByExtension(filepath.Ext(name))
	if ctype == "" {
		var buf [512]byte
		n, _ := io.ReadFull(content, buf[:])
		ctype = http.DetectContentType(buf[:n])
		return
	}
	return
}

func HandleFile(realPath, urlPath string, w http.ResponseWriter, r *http.Request) {
	suffix := strings.Replace(r.URL.Path, urlPath, "/", 1)
	fullPath, err := filepath.Abs(path.Join(realPath, suffix))
	if err != nil {
		log.Error(err.Error())
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	if !strings.HasPrefix(fullPath, realPath) {
		log.Error("prefix not match: path %v, prefix %v", fullPath, realPath)
		w.WriteHeader(http.StatusNotFound)
		return
	}
	fd, err := os.Open(fullPath)
	if err != nil {
		log.Error(err.Error())
		w.WriteHeader(http.StatusNotFound)
		return
	}
	stat, err := fd.Stat()
	if err != nil {
		log.Error(err.Error())
		w.WriteHeader(http.StatusNotFound)
		return
	}
	if !stat.Mode().IsRegular() {
		log.Error("requested file is not a regular file")
		w.WriteHeader(http.StatusNotFound)
		return
	}
	ctype, err := DetectCType(fullPath, fd)
	if err != nil {
		log.Error(err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", ctype)
	w.Header().Set("Last-Modified", stat.ModTime().UTC().Format(http.TimeFormat))
	w.Header().Set("Content-Disposition", "inline")
	_, err = io.Copy(w, fd)
	if err != nil {
		log.Error(err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
}
