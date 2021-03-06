#' Title Beverton-Holt fecundity, third model
#'
#' These functions return the negative log-likelihood of the data
#' given the model and parameters. model_BH3 is \eqn{F_i = \frac{\lambda_i}{1+\sum_j\alpha_{ij} N_{j}}}{(lambda_i)/(1 + sum(alpha_ij)N_j)}
#' 
#' @param par vector of variable length, with the following order: first, lambda of focal sp; 
#' second alpha, interaction coefficients with every species; 
#' last, sigma value. If any element is not to be optimized, it must not be present in this vector, but rather in the \code{fixed.terms} list
#' @param param.list string listing parameters to optimize. Possible elements are \code{lambda}, \code{lambda.cov}, \code{alpha}, \code{alpha.cov}.
#' @param log.fitness log of fitness value
#' @param focal.comp.matrix dataframe with as many rows as observations, and one column for each competitor sp. 
#' Values of the dataframe are number of competitors of each sp per observation.
#' @param num.covariates not used in model_BH3
#' @param num.competitors number of competitor species
#' @param focal.covariates not used in model_BH3.
#' @param fixed.terms list with elements \code{lambda}, \code{lambda.cov}, \code{alpha}, \code{alpha.cov}. It contains parameters not to be optimized.
#' Each element of the list must be of its appropriate length. Note that adding an element in "param.list" will force the function
#' to look for it in \code{par}, and will not consider it here. In this model, \code{lambda.cov} and \code{alpha.cov} are not considered.
#'
#' @return log-likelihood value
#' @import stats 
#' @export
model_BH3 <- function(par, 
                 param.list = c("lambda","alpha"), 
                 log.fitness, 
                 focal.comp.matrix, 
                 num.covariates = NULL, 
                 num.competitors = NULL, 
                 focal.covariates = NULL, 
                 fixed.terms = NULL){  
  pos <- 1
  if("lambda" %in% param.list){
    lambda <- par[pos] ## same as model 1
    pos <- pos + 1
  }else{
    lambda <- fixed.terms[["lambda"]]
  }
  
  if("alpha" %in% param.list){
    alpha <- par[pos:(pos+num.competitors-1)]
    pos <- pos + num.competitors
  }else{
    alpha <- fixed.terms[["alpha"]]
  }
  
  # lambda <- par[1] #same as model 2
  # alpha.vector <- par[2:(length(par)-1)] # new parameters- use alpha estimate from model 2 as start 
  # # value for fitting
  sigma <- par[length(par)] ## same as model 2
  # predictive model:
  term = 1 #create the denominator term for the model
  for(z in 1:ncol(focal.comp.matrix)){
    term <- term + alpha[z]*focal.comp.matrix[,z] 
  }
  pred <- lambda/ term
  # likelihood as before:
  llik <- dnorm(log.fitness, mean = (log(pred)), sd = (sigma), log = TRUE)
  # return sum of negative log likelihoods
  return(sum(-1*llik)) 
}