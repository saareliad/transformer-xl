# Notes

* need to add parameter for the eval frequency. (default is 4000 steps)

## base

### sizes

* n_all_param 151107538 (~151M)
* n_noemb_param 41066400 (~41M)

## larger

* increased base size
* we keep the fraction ` d_inner/d_model` the same
* added dropout according to relation.
* added warmup

### sizes

* n_all_param 200333570 (~200M)
* n_noemb_param 63518432 (~63M)


# TODOs

* parse results for nicer results analysis

