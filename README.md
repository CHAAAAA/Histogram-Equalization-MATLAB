
# Title
Histogram Equalization Implementation by MATLAB

# Problem To Solve

The contrast of some images is not obvious. Enhance the contrast can lead to better views of these images. Histogram equalization is a technique for adjusting image intensities to enhance contrast.

# Theory / Algorithms

Histogram equalization can make an image fill the available gray-scale range, and be uniformly distributed over that range.The following is the implementation process：

1. Compute the number of occurrences of gray level *k*. The $H_f(k)$ is the Histogram of the image. $$ f: H_f(k) {, k=0,...,K-1} $$
    >*K* being the total number of gray levels in the image.

2.  Compute the probability of an occurrence of a pixel of level *k* in the image. The $p_f(k)$ is the Normalized Histogram. $$ p_f(k) = \frac{H_f(k)}{NM} {, k=0,...,K-1} $$
    > $p_f(k)$ being in fact the image's histogram for pixel value *k*, normalized to [0,1].

3. Compute the cumulative distribution function corresponding to $p_f(k)$. The $P_f(r)$ is the Cumulative Histogram: $$ P_f(r) = \sum_{k=1}^r p_f(k) {, r=0,...,K-1} $$

4. Create a transformation of the form $k' = T(k)$ to produce a new image. Generally, there are two ways. (reference to [here](http://fourier.eng.hmc.edu/e161/lectures/contrast_transform/node2.html))
        $$ k' =  \frac{(K-1)}{(B-A)}  [P_f(r) - A]  {, r=0,...,K-1} \tag{1}$$
        $$ k' =  (K-1)  P_f(r) {, r=0,...,K-1} \tag{2}$$

    > In formula *( 1 )*, $A=P_f(r)_{min},B=P_f(r)_{max}$. I use the formula *( 2 )* in my program.

5. According to *k'* to calculate the new image.

6. Get the new image and histograms. 
# Results

![Results](https://bytebucket.org/wycmaka/histogramequalization/raw/a23e6b7c9b4e37f8dd8419a9acfd5dcf6fa1cb28/result.jpg?token=e11dd9472e82baaa1ba750d0e8482a33dfa2ad48)

# Core Codes

#### Compute the number of occurrences of each gray level

```MATLAB
NumPixel = zeros(1,256);
for i = 1:height
    for j = 1:width
        NumPixel( I(i,j) + 1 ) = NumPixel( I(i,j) + 1 ) + 1;
    end
end
```

#### Compute the probability of an occurrence of each gray level

```MATLAB
[height,width] = size(I);
ProbPixel = zeros(1,256);
for i = 1:256
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);
end
```

#### Compute the cumulative distribution function

```MATLAB
Cumupixel = zeros(1,256);
for i = 1:256
    if i == 1
        Cumupixel(i) = ProbPixel(i);
    else
        Cumupixel(i) = Cumupixel(i - 1) + ProbPixel(i);
    end
end
```
#### Mapping

```MATLAB
Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * Cumupixel(i) + 0.5);
end
for i = 1:height
    for j = 1:width
        I(i,j) = Map(I(i,j) + 1);
    end
end
```

# Sum Up

Histogram equalization can clearly increases the contrast of images, especially when the usable data of the image is represented by close contrast values.Through this adjustment, the intensities can be better distributed on the histogram and the image can show more details. But it may make the image's contrast unnatural or make some image's details disappear.


