\name{PRcurve}
\alias{PRcurve}

\title{
Plot a Precision/Recall curve
}
\description{
  Precision/recall (PR) curves are visual representations of the performance
of a classification model in terms of the precision and recall
statistics. The curves are obtained by proper interpolation of the
values of the statistics at different working points. These working
points can be given by different cut-off limits on a ranking of the
class of interest provided by the model.
}
\usage{
PRcurve(preds, trues, ...)
}

\arguments{
  \item{preds}{
A vector containing the
          predictions of the model.
}
  \item{trues}{
A vector containing the
          true values of the class label. Must have the same dimension as \code{preds}.
}
\item{\dots}{
  Further parameters that are passed to the \code{plot()} function.
}
}
\details{
  This function uses the infra-structure provided by the \code{ROCR}
  package (Sing et al., 2009). This package allows us to obtain several
  measures of the predictive performance of models. We use it to obtain
  the precision and recall of the predictions of a model. We then
  calculate the interpolated precision to avoid the saw-tooth effect
  that we would get with the standard plots produced by the ROCR
  package. The interpolated precision for a value r of recall is the the
  highest precision value for any recall level greather or equal to r.
}
\references{
Sing, T., Sander, O., Beerenwinkel, N., and Lengauer, T. (2009). \emph{ROCR:
Visualizing the performance of scoring classifiers}. R package version 1.0-4.

Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  

}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
\code{\link{prediction}}, \code{\link{performance}}, \code{\link{CRchart}}
}
\examples{
## A simple example with data in package ROCR
library(ROCR)
data(ROCR.simple)
pred <- prediction(ROCR.simple$predictions,ROCR.simple$labels)
perf <- performance(pred,"prec","rec")
## The plot obtained with the standard ROCR functions
\dontrun{
plot(perf)
}

## Now our Precision/Recall curve avoiding the saw-tooth effect
\dontrun{
PRcurve(ROCR.simple$predictions,ROCR.simple$labels)
}
}
\keyword{models}