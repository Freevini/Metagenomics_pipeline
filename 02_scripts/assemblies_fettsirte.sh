####----------------
##Cottens fettsirte metagenomics assembly
##Vincent Somerville
##20171106
####----------------


##locations

DATA_ROOT=/home/bioinf/bioinf_archive/43_sovi_storage/Projects/Fettsirte/Run20171109
minimap2_root=/home/bioinf/extradrv/minimap2/minimap2
miniasm_root=/home/bioinf/extradrv/miniasm
SMRTLINK_ROOT=/home/bioinf/extradrv/opt/pacbio/smrtlink/userdata/jobs_root/000
blast_root=/home/bioinf/extradrv/ncbi-blast-2.7.1+/bin
blastdb=/home/bioinf/bioinf_archive/43_sovi_storage/blastArchive
abruijn_root=/home/bioinf/extradrv/abruijn/ABruijn-master/bin
echo "version control of tools"
$minimap2_root --version



###==========================
##Minimap2 Overlap
###==========================
$minimap2_root -x ava-pb $DATA_ROOT/01_cottens_min5000bp/reads.fastq > $DATA_ROOT/03_minimap_miniasm/01_minimap/20171113/cottens_minimap.paf

###==========================
##miniasm
###==========================

/home/bioinf/extradrv/miniasm/miniasm -f $DATA_ROOT/01_SMRTlink_data/01_cottens_min5000bp/reads.fastq $DATA_ROOT/03_minimap_miniasm/01_minimap/20171113/cottens_minimap.paf > $DATA_ROOT/03_minimap_miniasm/02_miniasm/20171113/cottens_minimap.gfa

###==========================
##abruijn
###==========================

##extract raw data
for name in cottens lapraz
   do
     tar -zxvf $DATA_ROOT/01_SMRTlink_data/${name}/reads.tar.gz $DATA_ROOT/01_SMRTlink_data/${name}/
   done


date=$(date +%Y%m%d)

##creat abruijn directories
for name in cottens lapraz
   do
    mkdir -p $DATA_ROOT/05_abruijn/${date}assembly_${name}/{quast,fasta}
   done

##creat abruijn directories

cov=100
for name in cottens lapraz
  do
    $abruijn_root/abruijn $DATA_ROOT/01_SMRTlink_data/${name}/reads.fastq $DATA_ROOT/05_abruijn/${date}assembly_${name}/fasta/ ${cov} -p pacbio -o 2500
    cov=300
  done

###==========================
##smrtlink workflow
###==========================
date=$(date +%Y%m%d)

for name in cottens lapraz
   do
    mkdir -p $DATA_ROOT/04_HGAP4/${date}assembly_${name}/{quast,fasta}
   done

for name in cottens lapraz
   do
    quast.py $DATA_ROOT/04_HGAP4/${date}assembly_${name}/fasta/assembly.fasta -t 8 -o $DATA_ROOT/04_HGAP4/${date}assembly_${name}/quast/
   done


###-----------------
##blast
###-----------------
ls $blastdb | awk -F. '{print $1, $2}' | sed 's/ /./g'> $blastdb/filelist.txt

for FILE in `cat $blastdb/filelist.txt`
  do
    gunzip -c $blastdb/${FILE}*
    perl $DATA_ROOT/02_scripts/gbk2fasta.pl < $blastdb/${FILE}* >> $blastdb/all_prokaryotes.fa
    rm $blastdb/${FILE}*.gbff
  done

gzip $blastdb/*.gbff

##creat blastdb
$blast_root/makeblastdb -max_file_sz 10GB -in $blastdb/all_prokaryotes.fa -out $blastdb/all_prokaryotes -parse_seqids -dbtype nucl

##blast assembly
date=20171114
for name in cottens lapraz
   do
     #mkdir -p $DATA_ROOT/04_HGAP4/${date}assembly_${name}/blast/
     $blast_root/blastn -num_threads 16 -max_hsps 2 -max_target_seqs 2 -task megablast -show_gis -query $DATA_ROOT/04_HGAP4/${date}assembly_${name}/fasta/assembly.fasta -outfmt "6 sallseqid sgi" -db $blastdb/all_prokaryotes -out $DATA_ROOT/04_HGAP4/${date}assembly_${name}/blast/blastAssembly_04.txt -evalue 0.01 -word_size 64
   done
##sort for best hit
sort -k1,1 -k12,12nr -k11,11n  04_HGAP4/20171114assembly_lapraz/blast/blastAssembly_03.txt | sort -u -k1,1 --merge
