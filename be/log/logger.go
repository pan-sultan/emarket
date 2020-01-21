package log

import (
	"fmt"
	"os"
)

var elog = &logger{}

type logger struct {
}

func (r *logger) Debug(format string, a ...interface{}) {
	fmt.Println(fmt.Sprintf(format, a...))
}

func (r *logger) Error(format string, a ...interface{}) {
	fmt.Println(fmt.Sprintf(format, a...))
}

func (r *logger) Fatal(format string, a ...interface{}) {
	r.Error(format, a...)
	os.Exit(1)
}

func Debug(format string, a ...interface{}) {
	elog.Debug(format, a...)
}

func Error(format string, a ...interface{}) {
	elog.Error(format, a...)
}

func Fatal(format string, a ...interface{}) {
	elog.Fatal(format, a...)
}
