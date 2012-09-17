#
# Configuration for the lapack library:
#

MACRO(FEATURE_LAPACK_FIND_EXTERNAL var)

  FIND_PACKAGE(LAPACK)

  IF(LAPACK_FOUND)
    SET(${var} TRUE)
  ENDIF()

ENDMACRO()


MACRO(FEATURE_LAPACK_CONFIGURE_EXTERNAL var)

  SET(CMAKE_SHARED_LINKER_FLAGS
    "${CMAKE_SHARED_LINKER_FLAGS} ${LAPACK_LINKER_FLAGS}"
    )

  LIST(APPEND deal_ii_external_libraries
    ${LAPACK_LIBRARIES}
    )

  LIST(APPEND CMAKE_REQUIRED_LIBRARIES "${LAPACK_LIBRARIES}")
  LIST(APPEND CMAKE_REQUIRED_FLAGS "${LAPACK_LINKER_FLAGS}")

  #
  # TODO: Reduce to the really necessary parts.
  #
  CHECK_FUNCTION_EXISTS(saxpy_ HAVE_SAXPY_)
  CHECK_FUNCTION_EXISTS(sgeevx_ HAVE_SGEEVX_)
  CHECK_FUNCTION_EXISTS(sgeev_ HAVE_SGEEV_)
  CHECK_FUNCTION_EXISTS(sgelsd_ HAVE_SGELSD_)
  CHECK_FUNCTION_EXISTS(sgemm_ HAVE_SGEMM_)
  CHECK_FUNCTION_EXISTS(sgemv_ HAVE_SGEMV_)
  CHECK_FUNCTION_EXISTS(sgeqrf_ HAVE_SGEQRF_)
  CHECK_FUNCTION_EXISTS(sgesdd_ HAVE_SGESDD_)
  CHECK_FUNCTION_EXISTS(sgesvd_ HAVE_SGESVD_)
  CHECK_FUNCTION_EXISTS(sgetrf_ HAVE_SGETRF_)
  CHECK_FUNCTION_EXISTS(sgetri_ HAVE_SGETRI_)
  CHECK_FUNCTION_EXISTS(sgetrs_ HAVE_SGETRS_)
  CHECK_FUNCTION_EXISTS(sorgqr_ HAVE_SORGQR_)
  CHECK_FUNCTION_EXISTS(sormqr_ HAVE_SORMQR_)
  CHECK_FUNCTION_EXISTS(sstev_ HAVE_SSTEV_)
  CHECK_FUNCTION_EXISTS(ssyevx_ HAVE_SSYEVX_)
  CHECK_FUNCTION_EXISTS(ssygvx_ HAVE_SSYGVX_)
  CHECK_FUNCTION_EXISTS(strtrs_ HAVE_STRTRS_)

  LIST(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES "${LAPACK_LIBRARIES}")
  LIST(REMOVE_ITEM CMAKE_REQUIRED_FLAGS "${LAPACK_LINKER_FLAGS}")

  SET(HAVE_LIBLAPACK TRUE)

  SET(${var} TRUE)

ENDMACRO()


CONFIGURE_FEATURE(LAPACK)
