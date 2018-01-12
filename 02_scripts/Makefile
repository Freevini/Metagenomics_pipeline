all: result/c01.fin.v30.20x6000000/9-terminator/c01.fin.v30.20x6000000.scf.fasta

result/c01.fin.v30.20x6000000/9-terminator/c01.fin.v30.20x6000000.scf.fasta: result/c01.fin.v30.20x6000000.frg
	SGE_RREQ="" /home/imai/wgs/Linux-amd64/bin//runCA -dir result/`basename $< .frg` -p `basename $< .frg` -s /dev/null $< 
result/c_l0.idfq.gz: /home/bioinf/bioinf_archive/43_sovi_storage/Projects/Fettsirte/Run20171109/01_SMRTlink_data/cottens/reads.fastq
	SGE_RREQ="" STMP=`mktemp -d --tmpdir sprai-XXXXXX` ; set -o pipefail; /home/bioinf/extradrv/sprai-0.9.9.23//fa2fq.pl $< | /home/bioinf/extradrv/sprai-0.9.9.23//dumbbell_filter.pl - | /home/bioinf/extradrv/sprai-0.9.9.23//fq2idfq.pl - --prefix result/c_l0 | gzip -c -1 > $$STMP/c_l0.idfq.gz && cp -p $$STMP/c_l0.idfq.gz $@ && openssl dgst $$STMP/c_l0.idfq.gz $@; status=$$?; rm -fr $$STMP;exit $$status

result/c_l0.q.idfq.gz: result/c_l0.idfq.gz
	SGE_RREQ="" STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//fqfilt.pl - 8000 -max_len 1000000000000000 | gzip -c -1 > $$STMP/c_l0.q.idfq.gz && cp -p $$STMP/c_l0.q.idfq.gz $@ && openssl dgst $$STMP/c_l0.q.idfq.gz $@; status=$$?; rm -fr $$STMP; exit $$status

result/c0_imakeblastdb.done: result/c_l0.idfq.gz
	SGE_RREQ="" gzip -d -c result/c_l0.idfq.gz | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl -f - | sed -e 's/^>/>l0_s/' | /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//makeblastdb -in - -dbtype nucl -out result/tmp_blastdb/c_l0 -title c_l0 
	touch $@

result/tmp_blastdb/all_libs.nal: result/c0_imakeblastdb.done
	echo TITLE all_libs > $@
	echo DBLIST c_l0 >> $@

result/c_l0_partition_fa.done: result/c_l0.q.idfq.gz
	SGE_RREQ="" gzip -d -c result/c_l0.q.idfq.gz | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl -f - | sed -e 's/^>/>l0_s/' | /home/bioinf/extradrv/sprai-0.9.9.23//partition_fa.pl - 24 -p result/tmp_fa_l0/c_l0
	touch $@

result/tmp_dfq_l0/c_l0_0000.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0000.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0000.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0001.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0001.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0001.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0002.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0002.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0002.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0003.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0003.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0003.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0004.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0004.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0004.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0005.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0005.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0005.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0006.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0006.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0006.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0007.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0007.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0007.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0008.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0008.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0008.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0009.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0009.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0009.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0010.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0010.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0010.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0011.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0011.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0011.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0012.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0012.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0012.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0013.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0013.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0013.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0014.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0014.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0014.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0015.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0015.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0015.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0016.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0016.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0016.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0017.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0017.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0017.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0018.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0018.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0018.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0019.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0019.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0019.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0020.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0020.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0020.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0021.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0021.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0021.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0022.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0022.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0022.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0/c_l0_0023.blast.sam.gz : result/c_l0_partition_fa.done result/tmp_blastdb/all_libs.nal
	 STMP=`mktemp -d --tmpdir sprai-XXXXXX`; set -o pipefail; mkdir -p $$STMP/result && cp -rp result/tmp_blastdb $$STMP/result && cp -p result/tmp_fa_l0/c_l0_0023.fa $$STMP/input && openssl dgst result/tmp_fa_l0/c_l0_0023.fa $$STMP/input && /home/bioinf/extradrv/ncbi-blast-2.7.1+/bin//blastn -dbsize 1 -num_threads 1 -word_size 18 -max_target_seqs 100  -evalue 1e-50 -outfmt '7 qseqid sstart send sacc qstart qend bitscore evalue pident qseq sseq' -db $$STMP/result/tmp_blastdb/all_libs -query $$STMP/input | cat | /home/bioinf/extradrv/sprai-0.9.9.23//bfmt72s -c 42 -u -i - | gzip -c -1 > $$STMP/output.tmp && cp -p $$STMP/output.tmp $@ ; status=$$?; rm -fr $$STMP; exit $$status

result/tmp_dfq_l0.v30/c_l0_0000.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0000.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0001.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0001.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0002.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0002.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0003.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0003.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0004.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0004.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0005.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0005.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0006.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0006.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0007.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0007.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0008.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0008.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0009.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0009.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0010.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0010.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0011.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0011.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0012.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0012.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0013.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0013.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0014.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0014.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0015.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0015.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0016.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0016.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0017.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0017.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0018.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0018.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0019.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0019.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0020.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0020.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0021.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0021.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0022.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0022.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_dfq_l0.v30/c_l0_0023.v30.dfq.gz: result/tmp_dfq_l0/c_l0_0023.blast.sam.gz
	SGE_RREQ="" gzip -dc $< | /home/bioinf/extradrv/sprai-0.9.9.23//nss2v_v3 -r 128000 -v 30 - | /home/bioinf/extradrv/sprai-0.9.9.23//myrealigner -f -B 30 -b 3 -d 0.5 - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0000.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0000.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0001.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0001.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0002.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0002.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0003.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0003.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0004.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0004.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0005.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0005.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0006.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0006.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0007.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0007.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0008.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0008.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0009.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0009.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0010.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0010.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0011.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0011.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0012.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0012.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0013.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0013.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0014.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0014.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0015.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0015.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0016.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0016.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0017.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0017.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0018.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0018.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0019.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0019.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0020.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0020.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0021.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0021.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0022.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0022.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_idfq_l0.v30/c_l0.refined_0023.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0023.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/c_l0.1.v30.idfq.gz : result/tmp_idfq_l0.v30/c_l0.refined_0000.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0001.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0002.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0003.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0004.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0005.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0006.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0007.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0008.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0009.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0010.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0011.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0012.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0013.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0014.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0015.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0016.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0017.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0018.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0019.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0020.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0021.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0022.v30.idfq.gz result/tmp_idfq_l0.v30/c_l0.refined_0023.v30.idfq.gz
	cat $^ > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0000.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0000.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0001.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0001.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0002.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0002.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0003.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0003.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0004.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0004.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0005.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0005.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0006.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0006.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0007.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0007.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0008.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0008.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0009.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0009.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0010.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0010.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0011.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0011.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0012.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0012.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0013.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0013.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0014.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0014.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0015.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0015.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0016.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0016.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0017.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0017.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0018.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0018.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0019.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0019.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0020.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0020.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0021.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0021.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0022.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0022.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@

result/tmp_finish_l0.v30/c_l0.refined_0023.fin.v30.idfq.gz: result/tmp_dfq_l0.v30/c_l0_0023.v30.dfq.gz
	SGE_RREQ="" gzip -d -c $< | /home/bioinf/extradrv/sprai-0.9.9.23//dfq2fq_v2.pl - -finish -valid_depth 4 -valid_read_length 500 | gzip -c -1 > $@.tmp && mv $@.tmp $@


result/c_l0.1.fin.v30.idfq.gz: result/tmp_finish_l0.v30/c_l0.refined_0000.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0001.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0002.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0003.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0004.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0005.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0006.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0007.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0008.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0009.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0010.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0011.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0012.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0013.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0014.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0015.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0016.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0017.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0018.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0019.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0020.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0021.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0022.fin.v30.idfq.gz result/tmp_finish_l0.v30/c_l0.refined_0023.fin.v30.idfq.gz
	cat $^ > $@.tmp && mv $@.tmp $@

ec.done: result/c_l0.1.fin.v30.idfq.gz
	touch $@;

ec_only: ec.done

result/c01.fin.v30.20x6000000.fq: result/c_l0.1.fin.v30.idfq.gz
	SGE_RREQ="" STMP=`mktemp -d --tmpdir sprai-XXXXXX`;gzip -d -c $^ > $$STMP/ec.idfq && /home/bioinf/extradrv/sprai-0.9.9.23//get_top_20x_fa.pl $$STMP/ec.idfq -l -g 6000000 -q > $@.tmp && mv $@.tmp $@; status=$$?; rm -fr $$STMP; exit $$status 

result/c01.fin.v30.20x6000000.frg: result/c01.fin.v30.20x6000000.fq
	/home/imai/wgs/Linux-amd64/bin//fastqToCA -libraryname foo -technology pacbio-corrected -reads $<  > $@

.PHONY: prepfrg
prepfrg: result/c01.fin.v30.20x6000000.frg

