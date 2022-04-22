FROM public.ecr.aws/lambda/python:3.8-arm64

# install essential library
RUN yum -y install python3-dev python3-setuptools libtinfo-dev zlib1g-dev build-essential git libgomp gcc-gfortran libgfortran blas lapack atlas-sse3-devel

RUN mkdir -p /var/task/lib
# git clone
RUN git clone https://github.com/jaeriver/lambda_torch_profiling.git
WORKDIR lambda_torch_profiling
RUN pip3 install -r requirements.txt

RUN cp lambda_function.py ${LAMBDA_TASK_ROOT}

CMD ["lambda_function.lambda_handler"]
