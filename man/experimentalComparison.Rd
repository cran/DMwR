\name{experimentalComparison}
\alias{experimentalComparison}

\title{
Carry out Experimental Comparisons Among Learning Systems
}
\description{
This function can be used to carry out different types of experimental
comparisons among learning systems on a set of predictive tasks. This is
a generic function that should work with any learning system provided a
few assumptions are met. The function implements different experimental
methodologies, namely: cross validation, leave one out cross validation,
hold-out, monte carlo simulations and bootstrap.
}
\usage{
experimentalComparison(datasets, systems, setts, ...)
}

\arguments{
  \item{datasets}{
This is a list of objects of class \code{dataset}, containing the data
  sets that will be used in the comparison.
}
  \item{systems}{
This is a list of objects of class \code{learner}, containing the
  learning systems that will be used in the comparison.

}
  \item{setts}{
This is an object belonging to any of the sub-classes of the virtual
  class \code{expSettings}. It is the class of this object that
  determines the type of experimental comparison that will be carried
  out. See section Details for the possible values.
}
\item{\dots}{
Other parameter settings that are to be passed to the functions actually
  carrying out the experiments (e.g. \code{crossValidation}, etc.).
}
}
\details{
The goal of this function is to allow to carry out different types of
  experimental comparisons between a set of learning systems over a set
  of predictive tasks. The idea is that all learning system will be
  compared over the same data partitions for each of the tasks thus
  ensuring fare comparisons and also allowing for proper statistical
  tests of significance of the observed differences, to be carried out.

  Currently, the function allows for 5 different types of experimental
  comparisons to be carried out. These different types are in effect,
  different estimation methods for the target evaluation statistics that
  are to be used in evaluation the different learners over the
  tasks. The method to be used is determined by the class of the object
  provided in the argument \code{setts}. The following are the
  possibilities:

  "Cross validation": this type of estimates can be obtained by
  providing in the \code{setts} argument and object of class
  \code{cvSettings}. More details on this type of experiments can be
  obtained in the help page of the function \code{\link{crossValidation}}.

  "Leave one out cross validation": this type of estimates can be obtained by
  providing in the \code{setts} argument and object of class
  \code{loocvSettings}. More details on this type of experiments can be
  obtained in the help page of the function \code{\link{loocv}}.

   "Hold out": this type of estimates can be obtained by
  providing in the \code{setts} argument and object of class
  \code{hldSettings}. More details on this type of experiments can be
  obtained in the help page of the function \code{\link{holdOut}}.
  
   "Monte carlo": this type of estimates can be obtained by
  providing in the \code{setts} argument and object of class
  \code{mcSettings}. More details on this type of experiments can be
  obtained in the help page of the function \code{\link{monteCarlo}}.

   "Bootstrap": this type of estimates can be obtained by
  providing in the \code{setts} argument and object of class
  \code{bootSettings}. More details on this type of experiments can be
  obtained in the help page of the function \code{\link{bootstrap}}.

}
\value{
  The result of the function is an object of class \code{compExp} (type
  "class?compExp" for details).
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }

\seealso{
  \code{\link{variants}},\code{\link{bestScores}},\code{\link{rankSystems}},
  \code{\link{compAnalysis}}, \code{\link{crossValidation}}, \code{\link{loocv}},
\code{\link{holdOut}}, \code{\link{monteCarlo}},
  \code{\link{bootstrap}},  \code{\linkS4class{compExp}},
  \code{\linkS4class{cvSettings}},  \code{\linkS4class{hldSettings}},
  \code{\linkS4class{mcSettings}},  \code{\linkS4class{loocvSettings}},
  \code{\linkS4class{bootSettings}}

}
\examples{
## Estimating several evaluation metrics on different variants of a
## regression tree and of a SVM, on  two data sets, using one repetition
## of 10-fold CV
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

results <- experimentalComparison(
               c(dataset(Infant.Mortality ~ ., swiss),
                 dataset(mpg ~ ., mtcars)),
               c(variants('cv.rpartXse',se=c(0,0.5,1))),
               cvSettings(1,10,1234)
                                 )
## Check a summary of the results
summary(results)

bestScores(results)

## Check the statistical significance against the best model in terms of
## nmse for the swiss data set
compAnalysis(results,against='cv.rpartXse.v3',stats='nmse',datasets='swiss')

## Plot them
\dontrun{
plot(results)
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }

