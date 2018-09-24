#Convert rows of a data frame to a list----------------------------------------
DfRowsToList <- function(Df) {
  as.list(Df, list)
}

Test <- map(DataNested, DfRowsToList)


DfRowsToListMap <- function(Df) {
  pmap(as.list(Df), list)
}

TestMap <- DfRowsToList(DataNested)



##Get a list column from a data frame------------------------------------------
GetListColumn <- function(Df, ListColumn, ...) {
  map(DfRowsToList(Df), 
      ListColumn, GetListColumn)
}

##Get a neste "column" from a list column in a data frame----------------------
GetListColumnColumn <- function(Df, ListColumn, ListColumnColumn, ...) {
  map(
    map(DfRowsToList(Df), 
        ListColumn, GetListColumn),
    ListColumnColumn, GetListColumn)
}


##Get a Min Value from a nested column in a list column in a data frame
GetListColumnColumnMin <- function(Df, ListColumn, ListColumnColumn, ...){
  map_dbl(GetListColumnColumn(Df, ListColumn, ListColumnColumn), min)
}


##Map Versions----------------------------------------------------------------
