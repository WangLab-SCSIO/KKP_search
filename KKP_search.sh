awk 'BEGIN{FS="\t";OFS="\t"}  NR==FNR{a[NR]=$1"\t"$11"\t"$12"\t"$28"\t"$29"\t"$4} (NR>FNR&&($28 ~ /COG0631/||$29 ~ /pfam13672/)){split(a[FNR+1],b,"\t"); split(a[FNR+2],c,"\t");split(a[FNR-1],d,"\t"); split(a[FNR-2],e,"\t");if ($11=="+"  && (b[4] ~ /COG0515/||b[5] ~ /pfam00069/) && (c[4] ~ /COG0515/||c[5] ~ /pfam00069/) && ($4==b[6]) && ($4==c[6]) && (sqrt(($1-c[1])*($1-c[1]))==2) && (sqrt(($1-b[1])*($1-b[1]))==1)) print $1,$11,$12,$28,$29,$4"\n"a[FNR+1]"\n"a[FNR+2];else if($11=="-" &&(d[4] ~ /COG0515/||d[5] ~ /pfam00069/)&&(e[4] ~ /COG0515/||e[5] ~ /pfam00069/) && ($4==d[6]) && ($4==e[6]) && (sqrt(($1-d[1])*($1-d[1]))==1) && (sqrt(($1-e[1])*($1-e[1]))==2)) print a[FNR-2]"\n"a[FNR-1]"\n"$1,$11,$12,$28,$29,$4} ' Gene_data.txt Gene_data.txt >KKP_triple_gene.txt