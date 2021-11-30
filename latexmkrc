#=======================================================================
#     latexmkrc
#
#     Configuration file for LaTeX compilation using Latexmk.
#
#     This is a configuration file for Latexmk.
#     Copyright 2021 Tom M. Ragonneau.
#=======================================================================

# Generate pdf using pdflatex
$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;

# Configure pdflatex engine
push @generated_exts, "synctex.gz", "synctex(busy)";

# Remove extra extensions on clean
$clean_ext = "bbl ist loa mw run.xml";

# Build dependencies for the glossaries-extra package
add_cus_dep("acn", "acr", 0, "makeglo2gls");
add_cus_dep("glo", "gls", 0, "makeglo2gls");
sub makeglo2gls {
    if ($silent) {
        system("makeglossaries -q $_[0]");
    }
    else {
        system("makeglossaries $_[0]");
    };
}
push @generated_exts, "glg", "glo", "gls";
push @generated_exts, "acn", "acr", "alg";

# Build dependencies for the nomencl package
add_cus_dep("nlo", "nls", 0, "makenlo2nls");
sub makenlo2nls {
    system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls");
}
push @generated_exts, "nlo", "nls";
