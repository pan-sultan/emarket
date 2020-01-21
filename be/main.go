package main

import (
	"emarket/log"
	"emarket/utils"
	"net/http"
	"path/filepath"

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
	err := rootCmd.Execute()
	if err != nil {
		log.Fatal(err.Error())
	}
	staticDir, err = filepath.Abs(staticDir)
	if err != nil {
		log.Fatal(err.Error())
	}
	staticURL := "/static/"
	http.HandleFunc(staticURL, func(w http.ResponseWriter, r *http.Request) {
		utils.HandleFile(staticDir, staticURL, w, r)
	})
	log.Fatal(http.ListenAndServe(":8080", nil).Error())
}
