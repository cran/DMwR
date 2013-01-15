\name{CRchart}
\alias{CRchart}

\title{
Plot a Cumulative Recall chart

}
\description{
A cumulative recall chart plots the cumulative recall score against the
rate of positive class predictions of a classification model.
}
\usage{
CRchart(preds, trues, ...)
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
  The cumulative recall chart plots the recall against the rate of
  positive predictions. The latter measure the proportion of cases
  predicted as positivem while the former measure the proportion of
  positive cases signaled as such by the model.

  The function uses the infra-structure provided by the \code{ROCR}
  package (Sing et al., 2009). This package allows us to obtain several
  measures of the predictive performance of models. We use it to obtain
  the recall and the rate of positive predictions of the predictions of a model.
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

## Obtaining the Cumulative Recall chart for this problem
\dontrun{
CRchart(ROCR.simple$predictions,ROCR.simple$labels)
}
}
\keyword{models}