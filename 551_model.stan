data{
  int<lower=0> n_disease;
  vector[n_disease] y_disease;
  int<lower=0> n_healthy;
  vector[n_healthy] y_healthy;
}

parameters{
  real mu1;
  real<lower=0> sigma1;
  real mu0;
  real<lower=0> sigma0;
}

model{
  for(i in 1:n_disease)
    y_disease[i] ~ normal(mu1,sigma1);
  mu1 ~ normal(157,12);
  sigma1 ~ gamma(20,1);
  for(i in 1:n_healthy)
    y_healthy[i] ~ normal(mu0,sigma0);
  mu0 ~ normal(167,12);
  sigma0 ~ gamma(20,1);
}

generated quantities{
  vector[n_disease] y_disease_rep;
  for (n in 1: n_disease)
    y_disease_rep[n] = normal_rng(mu1, sigma1);
    
  vector[n_healthy] y_healthy_rep;
  for (n in 1: n_healthy)
    y_healthy_rep[n] = normal_rng(mu0, sigma0);
}

  
