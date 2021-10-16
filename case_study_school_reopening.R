
#--------Parameters----------------------
A = 83.6 # m2
H = 3.66 # m
N_pre = 30
tau_pre = 30 * 3600 # s, 30h
la = 5.4 / 3600 # s^-1
lf = 3.6 / 3600 # s^-1
pf = 0.5
pm = 0.95 * 0.25 + 0.05
pm = 0.288
RH = 0.2
Qb = 0.49 / 3600 # m3/s
Cq = 72

get_lv = function(RH) {
  lv = 0.6 / 3600 * RH
  return(lv)
}

get_vs = function(RH) {
  vs = 0.9382 / 3600 * (1 - RH) ** (-2/3)
  return(vs)
}

#---- steady transmission rate in base case-----------

pf * lf * 3600
get_vs(RH) / H * 3600
get_lv(RH) * 3600

l_tot_perh = la * 3600 + pf * lf * 3600 + get_vs(RH) / H * 3600 + get_lv(RH) * 3600
l_tot_perh
l_tot = l_tot_perh / 3600

pm_pre = 1
beta = Qb**2 * pm_pre**2 * Cq / (l_tot * V)
beta * 3600

beta_t = 0.1 / ((N_pre-1) * tau_pre)
beta_t * 3600

beta = 6.152e-4 / 3600
eps_tol = 0.1
p = eps_tol /((N_pre - 1) * tau_pre * beta * N_pre)
p * 100

pf_hepa = 0.9997
l_tot_perh_hepa = la * 3600 + pf_hepa * lf * 3600 + get_vs(RH) / H * 3600 + get_lv(RH) * 3600

beta_hepa_pctchg = (l_tot_perh / l_tot_perh_hepa - 1) * 100
beta_hepa_pctchg

pf_hepa_uv = 0.9999
l_tot_perh_hepa_uv = la * 3600 + pf_hepa_uv * lf * 3600 + get_vs(RH) / H * 3600 + get_lv(RH) * 3600

beta_hepa_uv_pctchg = (l_tot_perh / l_tot_perh_hepa_uv - 1) * 100
beta_hepa_uv_pctchg

pm_N95 = 0.193

beta_N95_pctchg = (pm_N95**2 / pm**2 - 1) * 100
beta_N95_pctchg

beta_pre_pctchg = (pm_pre**2 / pm**2 - 1) * 100
beta_pre_pctchg

la_incRH = 2.5 / 3600
lf_incRH = 6.5 / 3600
incRH = 0.5

l_tot_incRH_perh = la_incRH * 3600 + pf * lf_incRH * 3600 + get_vs(incRH) / H * 3600 + get_lv(incRH) * 3600
l_tot_incRH_perh

beta_incRH_pctchg = ((l_tot_perh / l_tot_incRH_perh) - 1) * 100
beta_incRH_pctchg
