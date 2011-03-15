\name{subset-methods}
\docType{methods}
\alias{subset-methods}
%%\alias{subset,ANY-method}
\alias{subset,compExp-method}
\title{Methods for Function subset in Package `DMwR'}
\description{
  The method subset when applied to objects of class \code{compExp} can
  be used to obtain another object of the same class with a subset of
  the experimental results contained in the orginal object.
}
\section{Methods}{
\describe{

  \item{\code{signature(x = "compExp")}}{
    The method has as first argument the object of class \code{compExp}
    that you wish to subset. This method also includes four extra arguments that
    you can use to supply the subsetting criteria.

    All subsetting is
    driven by the dimensions of the array \code{foldResults} that is one of
    the slots of the \code{compExp} object  (see "class?compExp" for
    further details).

    Namely, the parameter \code{its} of this method allows
    you to supply a vector with the subset of the repetitions of the
    experimental comparison that are to be "extracted" (this option is
    seldom used though as it is limited applicability).

    The parameter
    \code{stats} allows you to indicate a vector with the subset of
    evaluation statistics in the orginal object. Additionally, you can
    instead provide a regular expression to be matched against the name
    of the statistics measured in the experiment to specify the subset
    you want to select.

    The parameter \code{vars}
    can be used to provide a vector with the subset of learners (models)
    that are to be used in the subsetting. Additionally, you can
    instead provide a regular expression to be matched against the name
    of the learner variants evaluated in the experiment to specify the subset
    you want to select.

    Finally, the parameter \code{dss}
    allows you to indicate a vector with the subset of data sets to be
    extracted. Additionally, you can
    instead provide a regular expression to be matched against the name
    of the datasets used in the experiment to specify the subset
    you want to select. 

}
}}
\keyword{methods}

