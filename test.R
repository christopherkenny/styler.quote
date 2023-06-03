basepath = Sys.getenv("NMF_PATH")
outpath = Sys.getenv("NMF_OUT")
levels = Sys.getenv("NMF_LEVEL")
start = Sys.getenv("NMF_STATE_START", 1)
end = Sys.getenv("NMF_STATE_END", 51)

source(file.path(basepath, "cens-err/data-raw/R_proc/nmf.R"))
source(file.path(basepath, "cens-err/data-raw/R_proc/nmf_baf.R"))
source(file.path(basepath, "cens-err/data-raw/R_proc/nmf_make_agg.R"))
source(file.path(basepath, "cens-err/data-raw/R_proc/nmf_stats.R"))
source(file.path(basepath, "cens-err/data-raw/R_proc/nmf_workflow.R"))
source(file.path(basepath, "cens-err/data-raw/R_proc/utils.R"))

d_geo = nmf_extract_geocodes(basepath, level="block")
all_levels <- c("state", "county", "tract", "block group", "block")

states = c("DC", state.abb)[seq(as.integer(start), as.integer(end))]

levels <- str_split_1(levels, ",")
levels <- all_levels[sort(match(levels, all_levels))]
for (level in setdiff(levels, "block")) {
  log_msg("Starting ", level, "-level NMF", .type="debug")
  build_nmf(level, basepath, outpath)
  if (level != "state") {
    patch_missing(d_geo, level, basepath=outpath)
  }
}
if ("block" %in% levels) {
  for (state in states) {
    log_msg("Starting block-level NMF [statewise] for ", state, .type="debug")
    build_nmf_statewise("block", state, basepath, outpath)
    patch_missing(d_geo, "block", state, outpath)
    invisible(gc())
  }
}
log_msg("Processed all NMFs")
