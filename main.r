LocationOfThisScript = function() # Function LocationOfThisScript returns the location of this .R script (may be neeed to source other files in same dir)
{
    this.file = NULL
    # This file may be 'sourced'
    for (i in -(1:sys.nframe())) {
        if (identical(sys.function(i), base::source)) this.file = (normalizePath(sys.frame(i)$ofile))
    }
    
    if (!is.null(this.file)) return(dirname(this.file))
    
    # But it may also be called from the command line
    cmd.args = commandArgs(trailingOnly = FALSE)
    cmd.args.trailing = commandArgs(trailingOnly = TRUE)
    cmd.args = cmd.args[seq.int(from=1, length.out=length(cmd.args) - length(cmd.args.trailing))]
    res = gsub("^(?:--file=(.*)|.*)$", "\\1", cmd.args)
    
    # If multiple --file arguments are given, R uses the last one
    res = tail(res[res != ""], 1)
    if (0 < length(res)) return(dirname(res))
    
    # Both are not the case. Maybe we are in an R GUI?
    return(NULL)
}
current.dir = LocationOfThisScript()
source( paste(current.dir, "/readdata.r", sep=""))
dt<-readData()
source(paste(current.dir, "/plot1.r", sep=""))
source(paste(current.dir, "/plot2.r", sep=""))
source(paste(current.dir, "/plot3.r", sep=""))
source(paste(current.dir, "/plot4.r", sep=""))