\name{getVariant}
\alias{getVariant}

\title{
Obtain the learner associated with an identifier within a comparison
}
\description{
  The goal of this function is to obtain the \code{learner} object
  corresponding to a certain provided identifier in the context of an
  experimental comparison. This function finds its use after you run an
   experimental comparison using the infrastructure provided by
  the \code{experimentalComparison()} function. This latter function
  returns an object that contains the results of the several alternative
  methods that you have decided to compare. Each of these methods has an
  associated identifier (a string). This function allows you to obtain
  the learner object (which gives you access to several information
  necessary to run the associated algorithm), corresponding to its identifier.
}
\usage{
getVariant(var, ExpsData)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{var}{
This is the string that identifies the learner you which to "extract".
}
  \item{ExpsData}{
This is a \code{compExp} object (type "class?compExp" for details)  that
contains the results of an experimental comparison obtained through the
\code{experimentalComparison()} function. 
}
}
\details{
Most results analysis functions of the experimental infrastructure
provided by the \code{DMwR} package use the identifiers generated either
by calls to the \code{variants} function or names given by the
user. Each of these names is associated with a concrete learning
algorithm implemented by a R function and also to a set of parameter
settings of this function. The function \code{getVariant} allows you to
obtain all this information, in the form of a \code{learner} object,
which is associated to an identifier within a \code{compExp} object.
}
\value{
  The result of this function is an object of class \code{learner} (type
  "class?learner" for details).
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\seealso{
\code{\link{variants}}, \code{\link{experimentalComparison}}
}
\examples{
## Estimating several evaluation metrics on different variants of a
## regression tree on  a data set, using one repetition of 10-fold CV
data(swiss)

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
               c(dataset(Infant.Mortality ~ ., swiss)),
               c(variants('cv.rpartXse',se=c(0,0.5,1))),
               cvSettings(1,10,1234)
                                 )
## Get the best scores
bestScores(results)

# Obtain the settings corresponding to one of the variants
getVariant('cv.rpartXse.v1',results)

# Obtain the settings of the learner that got the best NMSE score on the
# swiss data set
getVariant(bestScores(results)$swiss['nmse','system'],results)

}

\keyword{ models }

