if [ ! -d venv ] ; then

	   virtualenv --python=python2.7 venv
   fi
   source venv/bin/activate
   export PYTHONPATH="$PWD:$PYTHONPATH"

   echo $PYTHONPATH 

   pip install pylint

   cd /home/damodar_neelapu/python/pandas
   ### Need this because some strange control sequences when using default TERM=xterm
#   export TERM="linux"

   ## || exit 0 because pylint only exits with 0 if everything is correct
   pylint --rcfile=pylint.cfg $(find . -maxdepth 1 -name "*.py" -print) pandas/ > pylint.log || exit 0
