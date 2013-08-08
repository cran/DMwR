\name{statScores}
\alias{statScores}

\title{
  Obtains a summary statistic of one of the evaluation metrics used in
  an experimental comparison, for all learners and data sets
  involved in the comparison.
}
\description{
  Given a \code{compExp} object this function provides a summary
  statistic (defaulting to the average score) of the different scores
  obtained on a single evaluation statistic over all repetitions carried
  out in the experimental process. This is done for all learners and
  data sets of the experimental comparison. The function can be handy to
  obtain things like for instance the maximum score obtained by each
  learner on a particular statistic over all repetitions of the
  experimental process.
}
\usage{
statScores(compRes, stat, summary = "mean")
}

\arguments{
  \item{compRes}{
    An object of class \code{compExp} with the results of the
  experimental comparison.
}
  \item{stat}{
    A string with the name of the evaluation metric for which you want to obtain
  the scores.
}
  \item{summary}{
    A string with the name of the function that should be used to
  aggregate the different repetition results into a single score
  (defaults to the mean value).
}
}
\value{
  The result of this function is a named list with as many components as
  there are data sets in the evaluation comparison being used. For each
  data set (component), we get a named vector with as many elements as
  there are learners in the experiment. The value for each learner is
  the result of applying the aggregation function (parameter
  \code{summary}) to the different scores obtained by the learner on the
  evaluation metric specified by the parameter \code{stat}.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }


\seealso{
\code{\link{experimentalComparison}}, \code{\link{bestScores}}, \code{\link{rankSystems}}
}
\examples{
## Estimating several evaluation metrics on different variants of a
## regression tree and of a SVM, on  two data sets, using one repetition
## of  10-fold CV
data(swiss)
data(mtcars)

## First the user defined functions 
cv.rpartXse <- function(form, train, test, ...) {
    require(DMwR)
    t <- rpartXse(form, train, ...)
    p <- predict(t, test)
    mse <- mean((p - resp(form, test))^2)
    c(nmse = mse/mean((mean(resp(form, train)) - resp(form, test))^2), 
        mse = mse)
}

## run the experimental comparison
results <- experimentalComparison(
               c(dataset(Infant.Mortality ~ ., swiss),
                 dataset(mpg ~ ., mtcars)),
               c(variants('cv.rpartXse',se=c(0,0.5,1))),
               cvSettings(1,10,1234)
                                 )

## Get the maximum value of nmse for each learner
statScores(results,'nmse','max')
## Get the interquartile range of the mse score for each learner
statScores(results,'mse','IQR')
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }

