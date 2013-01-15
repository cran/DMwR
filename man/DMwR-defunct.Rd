\name{DMwR-defunct}
%------ NOTE:  ../R/DMwR-defunct.R   must be synchronized with this!
\alias{DMwR-defunct}
\alias{slidingWindowTesting}
\alias{growingWindowTesting}
\alias{classWF}
\alias{regrWF}
\alias{slideRegrWF}
\alias{growRegrWF}
\alias{tsRegrWF}
\alias{slideClassWF}
\alias{growClassWF}
\alias{tsClassWF}

\title{Defunct Functions in Package \pkg{DMwR}}
\description{
  The functions or variables listed here are no longer part of package \pkg{DMwR} .
}
\usage{
slidingWindowTesting(learner,form,train,test,relearn.step=1,verbose=T)

growingWindowTest(learner,form,train,test,relearn.step=1,verbose=T)

classWF(form,train,test,learner,eval=.ClassStats,...)

regrWFn(form,train,test,learner,eval=.RegrStats,simpl=F,...)

slideRegrWF(...)

growRegrWF(...)

tsRegrWF(form,train,test,type,learner,eval=.RegrStats,simpl=F,relearn.step=1,verbose=T,...)

slideClassWF(...)

growClassWF(...)

tsClassWF(form,train,test,type,learner,eval=.ClassStats,relearn.step=1,verbose=T,...)
}
\seealso{
  \code{\link{Deprecated}}, \code{\link{Defunct}}
}
\keyword{internal}
