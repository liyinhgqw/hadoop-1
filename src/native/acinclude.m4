# AC_COMPUTE_NEEDED_DSO(LIBRARY, PREPROC_SYMBOL)
# --------------------------------------------------
# Compute the 'actual' dynamic-library used 
# for LIBRARY and set it to PREPROC_SYMBOL
AC_DEFUN([AC_COMPUTE_NEEDED_DSO],
[
AC_CACHE_CHECK([Checking for the 'actual' dynamic-library for '-l$1'], ac_cv_libname_$1,
  if test $1 = "z"; then
    ac_cv_libname_$1=/usr/lib/x86_64-linux-gnu/libz.so
  fi

  if test $1 = "snappy"; then
    ac_cv_libname_$1=/usr/lib/x86_64-linux-gnu/libsnappy.so
  fi

  if test -z "${ac_cv_libname_$1}"; then
      AC_MSG_ERROR(Failed to compute library location for $1)
  fi
  ]
)
AC_DEFINE_UNQUOTED($2, ${ac_cv_libname_$1}, [The 'actual' dynamic-library for '-l$1'])
])# AC_COMPUTE_NEEDED_DSO
