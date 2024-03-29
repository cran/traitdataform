# for roxygen2 documentation please edit file R/data.R!

temp <- tempfile(fileext = ".zip")
utils::download.file("https://ndownloader.figshare.com/files/5604752", temp, method = "auto", quiet = TRUE, mode="wb")
utils::unzip(temp, files = "PanTHERIA_1-0_WR05_Aug2008.txt", exdir = ".")
unlink(temp)
rm(temp)

pantheria <- utils::read.delim("PanTHERIA_1-0_WR05_Aug2008.txt",
                           fileEncoding = "UTF-8",
                           stringsAsFactors = FALSE)
file.remove("PanTHERIA_1-0_WR05_Aug2008.txt")

attr(pantheria,'metadata') <- traitdataform::as.metadata(
  datasetName = "PanTHERIA",
  datasetID = "pantheria",
  bibliographicCitation = utils::bibentry(
    bibtype = "Article",
    title = "PanTHERIA: a species-level database of life history, ecology, and geography of extant and recently extinct mammals",
    journal = "Ecology",
    volume = 90,
    pages = 2648,
    author = c(utils::person(given = "Kate E.", family = "Jones", email = "Kate.Jones@ioz.ac.uk"), utils::as.person("Jon Bielby, Marcel Cardillo, Susanne A. Fritz, Justin O'Dell, C. David L. Orme, Kamran Safi, Wes Sechrest, Elizabeth H. Boakes, Chris Carbone, Christina Connolly, Michael J. Cutts, Janine K. Foster, Richard Grenyer, Michael Habib, Christopher A. Plaster, Samantha A. Price, Elizabeth A. Rigby, Janna Rist, Amber Teacher, Olaf R. P. Bininda-Emonds, John L. Gittleman, Georgina M. Mace, and Andy Purvis")
    ),
    year = 2009,
    doi = "10.1890/08-1494.1"
  ),
  author = "Kate E. Jones",
  license = "http://creativecommons.org/publicdomain/zero/1.0/"
  
)

#AET – Actual Evapotransipration Rate; C – centigrade; d – days; dd – decimal degrees; deg – degrees; EXT – extrapolated; g – grams; GR – geographic range; Grp – Group; HuPopDen – Human Population Density; Indiv – Individual; Isl - Island; Lat – Latitude; Len – Length; Long – Longitude; Max – Maximum; Met – Metabolic; Min – Minimum; mLO2hr – milliliters of O2 per hr; mm – millimeters;n/km2 – Number per km2; PET – Potential Evapotranspiration Rate; Precip – Precipitation; Temp – Temperature; and 5p – 5th percentile

pantheria[pantheria == -999] <- NA
attr(pantheria, 'taxa') <- "MSW05_Binomial"
attr(pantheria, 'keep') <-  c(references = "References", "")

