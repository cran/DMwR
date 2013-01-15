\name{SMOTE}
\alias{SMOTE}

\title{
SMOTE algorithm for unbalanced classification problems
}
\description{
This function handles unbalanced classification problems using the SMOTE
method. Namely, it can generate a new "SMOTEd" data set that addresses
the class unbalance problem. Alternatively, it can also run a
classification algorithm on this new data set and return the resulting
model. 
}
\usage{
SMOTE(form, data, perc.over = 200, k = 5, perc.under = 200,
      learner = NULL, ...)
}

\arguments{
  \item{form}{
A formula describing the prediction problem
}
  \item{data}{
A data frame containing the original (unbalanced) data set
}
  \item{perc.over}{
A number that drives the decision of how many extra cases from the
  minority class are generated (known as over-sampling).
}
  \item{k}{
A number indicating the number of nearest neighbours that are used to
  generate the new examples of the minority class.
}
  \item{perc.under}{
A number that drives the decision of how many extra cases from the
  majority classes are selected for each case generated from the
  minority class (known as under-sampling)
}
\item{learner}{
Optionally you may specify a string with the name of a function that
  implements a classification algorithm that will be applied to the
  resulting SMOTEd data set  (defaults to NULL).
}
  \item{\dots}{
In case you specify a learner (parameter  \code{learner}) you can
  indicate further arguments that will be used when calling this learner.
}
}
\details{
Unbalanced classification problems cause problems to many learning
  algorithms. These problems are characterized by  the uneven proportion
  of cases that are available for each class of the problem.

  SMOTE (Chawla et. al. 2002) is a well-known algorithm to fight this problem. The general
idea of this method is to artificially generate new examples of the minority
class using the nearest neighbors of these cases. Furthermore, the majority
class examples are also under-sampled, leading to a more balanced dataset.

The parameters \code{perc.over} and \code{perc.under} control the amount
of over-sampling of the minority class and under-sampling of the
majority classes, respectively. \code{perc.over} will tipically be a
number above 100. With this type of values, for each case in the orginal
data set belonging to the minority class, \code{perc.over/100} new
examples of that class will be created. If \code{perc.over} is a value
below 100 than a single case will be generated for a randomly selected proportion (given
by \code{perc.over/100}) of the cases belonging to the minority class on
the original data set. The parameter \code{perc.under} controls the
proportion of cases of the majority class that will be randomly selected
for the final "balanced" data set. This proportion is calculated with
respect to the number of newly generated minority class cases. For
instance, if 200 new examples were generated for the minority class, a
value of \code{perc.under} of 100 will randomly select exactly 200 cases
belonging to the majority classes from the original data set to belong
to the final data set. Values above 100 will select more examples from
the majority classes.

The parameter \code{k} controls the way the new examples are
created. For each currently existing minority class example X new
examples will be created (this is controlled by the parameter
\code{perc.over} as mentioned above). These examples will be generated
by using the information from the \code{k} nearest neighbours of each
example of the minority class. The parameter \code{k} controls how many
of these neighbours are used.

The function can also be used to obtain directely the classification
model from the resulting balanced data set. This can be done by
including the name of the R function that implements the classifier in
the parameter \code{learner}. You may also include other parameters that
will be forward to this learning function. If the \code{learner}
parameter is not \code{NULL} (the default) the returning value of the
function will be the learned model and not the balanced data set. The
function that learns the model should have as first parameter the
formula describing the classification problem and in the second argument
the training set.

}
\value{
  The function can return two different types of values depending on the
  value of the parameter \code{learner}. If this parameter is
  \code{NULL} (the default), the function will return a data frame with
  the new data set resulting from the application of the SMOTE
  algorithm. Otherwise the function will return the classification model
  obtained by the learner specified in the parameter \code{learner}.
}
\references{
  Chawla, N. V., Bowyer, K. W., Hall, L. O., and Kegelmeyer, W. P. (2002).
\emph{Smote: Synthetic minority over-sampling technique}. Journal of Artificial
Intelligence Research, 16:321-357.

  Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\examples{
## A small example with a data set created artificially from the IRIS
## data 
data(iris)
data <- iris[, c(1, 2, 5)]
data$Species <- factor(ifelse(data$Species == "setosa","rare","common")) 
## checking the class distribution of this artificial data set
table(data$Species)

## now using SMOTE to create a more "balanced problem"
newData <- SMOTE(Species ~ ., data, perc.over = 600,perc.under=100)
table(newData$Species)

## Checking visually the created data
\dontrun{
par(mfrow = c(1, 2))
plot(data[, 1], data[, 2], pch = 19 + as.integer(data[, 3]),
     main = "Original Data")
plot(newData[, 1], newData[, 2], pch = 19 + as.integer(newData[,3]),
     main = "SMOTE'd Data")
}

## Now an example where we obtain a model with the "balanced" data
classTree <- SMOTE(Species ~ ., data, perc.over = 600,perc.under=100,
                   learner='rpartXse',se=0.5)
## check the resulting classification tree
classTree
## The tree with the unbalanced data set would be
rpartXse(Species ~ .,data,se=0.5)
}

\keyword{models}

