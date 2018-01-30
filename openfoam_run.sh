#!/bin/bash

# run OpenFoam4 with tutrial model "pitzDaily"

WORKDIR=${HOME}/singularity-on-cfncluster/job_${JOB_ID}

source ${HOME}/.bashrc
mkdir ${WORKDIR}
cd ${WORKDIR}
cp -r ${HOME}/singularity-on-cfncluster/pitzDaily ./
cd ${WORKDIR}/pitzDaily

rm ${WORKDIR}/pitzDaily/0/U
cp ${HOME}/singularity-on-cfncluster/U_template ${WORKDIR}/pitzDaily/0/U
sed -i -e "s/\${xVelocity}/$1/g" 0/U
sed -i -e "s/\${yVelocity}/$2/g" 0/U
sed -i -e "s/\${zVelocity}/$3/g" 0/U
singularity exec ${HOME}/singularity-on-cfncluster/openfoam4.simg blockMesh
singularity exec ${HOME}/singularity-on-cfncluster/openfoam4.simg simpleFoam

