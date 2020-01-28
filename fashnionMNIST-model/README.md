# fashionMNIST-model

## 👨‍💻 Machine Learning Task 👨‍💻

## Deliverable

| Model                 	| Accuracy 	| Training Time 	| Edit 	|
|-----------------------	|----------	|:-------------:	|------	|
| Flux: 2-layer NN      	| 0.8287   	|    0:16:03    	|[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/PseudoCodeNerd/fashionMNIST-with-julia-fastAI/blob/master/flux-FMNIST-detailed.ipynb)|
| pyTorch: ResNet34 CNN 	| 0.8565   	|    0:03:19    	|[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/PseudoCodeNerd/fashionMNIST-with-julia-fastAI/blob/master/FashionMNIST-resnet34.ipynb)|
| Flux: ConvNet (3C,3MP,1D,1Sm)|0.9022|1:07:34|[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/PseudoCodeNerd/fashionMNIST-with-julia-fastAI/blob/master/flux-FMNIST-detailed.ipynb)|

[`Repository`](https://github.com/PseudoCodeNerd/fashionMNIST-with-julia-fastAI)

<hr>

## Add the Fashion MNIST model to the Flux model-zoo

### Task description

[Fashion MNIST](https://github.com/zalandoresearch/fashion-mnist) is a good way to introduce the concept of autoenoders and for classification tasks. Write an efficient Fashion MNIST implementation using Flux and benchmark it against equivalent implementations in TensorFlow and PyTorch. A good extension might be to have it run smoothly on GPUs too. The FashionMNIST dataset can be easily obtained and unpackaged into ready-to-use Julia data types with the help of [MLDatasets.jl](https://github.com/JuliaML/MLDatasets.jl). A working example of using Flux for classification of handwritten digits from the MNIST dataset can be found [here](https://github.com/JuliaML/MLDatasets.jl), for students who are already familiar with basic image detection techniques and want to hit the ground running. Flux's documentation can be found here Another reference material that may interest you is [this notebook](https://github.com/JuliaML/MLDatasets.jl) that handles the FashionMNIST dataset using keras and tensorflow.

Having accuracy plots, which detail how accuracy changes as learning progresses, for both frameworks would be a nice addition. *(Forgot to add them Ooof!)*  

If you need GPUs for your task, I'd recommend you to use NextJournal. If you need help setting up a Julia GPU session, just use the interactive chat icon in the bottom of the screen or contact one of the mentors on Slack.

I must explicitly say this that the **code from the model zoo and other sources mentioned sources is solely for reference. Please do copy-paste code without writing proper comments or understanding the code.**

<hr>
