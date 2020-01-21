package main

import (
	"emarket/log"
	"net/http"
	"path"
	"path/filepath"
	"strings"

	"github.com/spf13/cobra"
)

var (
	staticDir string
	rootCmd   = &cobra.Command{
		Use:   "",
		Short: "emarket backend",
		Long:  "emarket backend",
		Run: func(cmd *cobra.Command, args []string) {
		},
	}
)

func init() {
	rootCmd.Flags().StringVar(&staticDir, "static", "", "path to static files")
	if err := rootCmd.MarkFlagRequired("static"); err != nil {
		panic(err)
	}
}

func main() {
	if err := rootCmd.Execute(); err != nil {
		log.Fatal(err.Error())
	}
	staticURL := "/static/"
	http.HandleFunc(staticURL, func(w http.ResponseWriter, r *http.Request) {
		suffix := strings.Replace(r.URL.Path, staticURL, "/", 1)
		fullPath, err := filepath.Abs(path.Join(staticDir, suffix))
		if err != nil {
			log.Error(err.Error())
			w.WriteHeader(http.StatusBadRequest)
			return
		}
		log.Debug(fullPath)
		//http.FileServer(http.Dir(staticDir)).ServeHTTP(w, r)
	})
	log.Fatal(http.ListenAndServe(":8080", nil).Error())
}
