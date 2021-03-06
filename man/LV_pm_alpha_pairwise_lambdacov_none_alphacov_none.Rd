% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/LV_pm_alpha_pairwise_lambdacov_none_alphacov_none.R
\name{LV_pm_alpha_pairwise_lambdacov_none_alphacov_none}
\alias{LV_pm_alpha_pairwise_lambdacov_none_alphacov_none}
\title{Lotka-Volterra model with pairwise alphas and no covariate effects}
\usage{
LV_pm_alpha_pairwise_lambdacov_none_alphacov_none(
  par,
  fitness,
  neigh_intra_matrix = NULL,
  neigh_inter_matrix,
  covariates,
  fixed_parameters
)
}
\arguments{
\item{par}{1d vector of initial parameters: 'lambda', 'alpha_intra' (optional), 'alpha_inter', and 'sigma'}

\item{fitness}{1d vector of fitness observations, in log scale}

\item{neigh_intra_matrix}{optional matrix of one column, number of intraspecific neighbours for each observation}

\item{neigh_inter_matrix}{matrix of arbitrary columns, number of interspecific neighbours for each observation}

\item{covariates}{included for compatibility, not used in this model}

\item{fixed_parameters}{optional list specifying values of fixed parameters, 
with components "lambda","alpha_intra","alpha_inter".}
}
\value{
log-likelihood value
}
\description{
Lotka-Volterra model with pairwise alphas and no covariate effects
}
