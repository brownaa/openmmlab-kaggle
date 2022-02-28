# clones openmmlab repos commonly used in kaggle competitions
# or for general purpose computer vision applications
# creates tar.gz file for upload to kaggle and optionally removes openmmlab-repos directory

# make folder for repos
mkdir openmmlab-repos
mkdir openmmlab-repos/src

# mmcv
mkdir openmmlab-repos/mmcv
git clone https://github.com/open-mmlab/mmcv.git openmmlab-repos/mmcv
wget https://download.openmmlab.com/mmcv/dist/cu111/torch1.10.0/mmcv_full-1.3.17-cp37-cp37m-manylinux1_x86_64.whl -P openmmlab-repos/src
# mmdetection
mkdir openmmlab-repos/mmdetection
git clone --branch v2.17.0 https://github.com/open-mmlab/mmdetection.git openmmlab-repos/mmdetection

# download all requirements
pip download -d openmmlab-repos/src -r openmmlab-repos/mmcv/requirements.txt
pip download -d openmmlab-repos/src -r openmmlab-repos/mmdetection/requirements.txt

# remaining requirements
wget https://files.pythonhosted.org/packages/22/51/52442c59db26637681148c21f8984eed58c9db67053a0a4783a047010c98/importlib_metadata-4.2.0-py3-none-any.whl -P openmmlab-repos/src

# create tar.gz file
tar -czvf openmmlab-repos.tar.gz openmmlab-repos
ls -l openmmlab-repos.tar.gz

# remove folder if desired
if [ "$1" = "-r" ]; then
    rm -rf openmmlab-repos
    rm -rf src
    echo "openmmlab-repos directory removed"
else
    echo "openmmlab-repos directory not removed"
fi
