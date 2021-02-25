```python
import pandas as pd
```


```python
nvme = pd.read_json("nvme.json")
pvscsi = pd.read_json("pvscsi.json")
```


```python
nvme[["jobname","usr_cpu","sys_cpu", "ctx"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>usr_cpu</th>
      <th>sys_cpu</th>
      <th>ctx</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>100.000000</td>
      <td>100.000000</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>2.569324</td>
      <td>11.096770</td>
      <td>244024.300000</td>
    </tr>
    <tr>
      <th>std</th>
      <td>0.374268</td>
      <td>0.977924</td>
      <td>277.404875</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1.519222</td>
      <td>8.985791</td>
      <td>243285.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>2.341265</td>
      <td>10.395909</td>
      <td>243865.250000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>2.567894</td>
      <td>11.055315</td>
      <td>244074.500000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>2.811702</td>
      <td>11.901034</td>
      <td>244204.500000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>3.485191</td>
      <td>13.726128</td>
      <td>244571.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
pvscsi[["jobname","usr_cpu","sys_cpu", "ctx"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>usr_cpu</th>
      <th>sys_cpu</th>
      <th>ctx</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>100.000000</td>
      <td>100.000000</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>2.703239</td>
      <td>10.680056</td>
      <td>295242.760000</td>
    </tr>
    <tr>
      <th>std</th>
      <td>0.439809</td>
      <td>1.159410</td>
      <td>346.451831</td>
    </tr>
    <tr>
      <th>min</th>
      <td>1.647429</td>
      <td>7.765526</td>
      <td>294200.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>2.444757</td>
      <td>9.774740</td>
      <td>295015.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>2.677170</td>
      <td>10.743991</td>
      <td>295265.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>3.014129</td>
      <td>11.373644</td>
      <td>295526.500000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>3.811292</td>
      <td>14.679958</td>
      <td>295757.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
nvmesync = pd.json_normalize(nvme.sync)
pvscsisync = pd.json_normalize(pvscsi.sync)
```


```python
nvmesync[["lat_ns.mean", "lat_ns.max", "lat_ns.percentile.99.000000", "lat_ns.percentile.99.990000"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>lat_ns.mean</th>
      <th>lat_ns.max</th>
      <th>lat_ns.percentile.99.000000</th>
      <th>lat_ns.percentile.99.990000</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>100.000000</td>
      <td>1.000000e+02</td>
      <td>100.000000</td>
      <td>1.000000e+02</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>96774.224795</td>
      <td>3.432834e+06</td>
      <td>147522.560000</td>
      <td>1.567826e+06</td>
    </tr>
    <tr>
      <th>std</th>
      <td>8135.763078</td>
      <td>1.294979e+06</td>
      <td>11796.479057</td>
      <td>6.592982e+05</td>
    </tr>
    <tr>
      <th>min</th>
      <td>83685.344143</td>
      <td>1.929561e+06</td>
      <td>120320.000000</td>
      <td>3.993600e+05</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>90008.742244</td>
      <td>3.118649e+06</td>
      <td>138240.000000</td>
      <td>1.101824e+06</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>95896.103449</td>
      <td>3.139635e+06</td>
      <td>146432.000000</td>
      <td>1.294336e+06</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>102592.151319</td>
      <td>3.156941e+06</td>
      <td>156672.000000</td>
      <td>2.179072e+06</td>
    </tr>
    <tr>
      <th>max</th>
      <td>121141.768381</td>
      <td>1.190925e+07</td>
      <td>175104.000000</td>
      <td>2.998272e+06</td>
    </tr>
  </tbody>
</table>
</div>




```python
pvscsisync[["lat_ns.mean", "lat_ns.max", "lat_ns.percentile.99.000000", "lat_ns.percentile.99.990000"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>lat_ns.mean</th>
      <th>lat_ns.max</th>
      <th>lat_ns.percentile.99.000000</th>
      <th>lat_ns.percentile.99.990000</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>100.000000</td>
      <td>1.000000e+02</td>
      <td>100.000000</td>
      <td>1.000000e+02</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>96973.297300</td>
      <td>3.462853e+06</td>
      <td>147527.680000</td>
      <td>2.547876e+06</td>
    </tr>
    <tr>
      <th>std</th>
      <td>6313.352243</td>
      <td>9.339189e+05</td>
      <td>12427.495351</td>
      <td>3.555857e+05</td>
    </tr>
    <tr>
      <th>min</th>
      <td>86334.590645</td>
      <td>3.059335e+06</td>
      <td>124416.000000</td>
      <td>1.220608e+06</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>91907.474586</td>
      <td>3.130368e+06</td>
      <td>138240.000000</td>
      <td>2.310144e+06</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>96421.894330</td>
      <td>3.143186e+06</td>
      <td>147456.000000</td>
      <td>2.572288e+06</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>101229.867287</td>
      <td>3.164657e+06</td>
      <td>156672.000000</td>
      <td>2.801664e+06</td>
    </tr>
    <tr>
      <th>max</th>
      <td>112340.409158</td>
      <td>7.156912e+06</td>
      <td>177152.000000</td>
      <td>3.063808e+06</td>
    </tr>
  </tbody>
</table>
</div>




```python
nvmewrite = pd.json_normalize(nvme.write)
pvscsiwrite = pd.json_normalize(pvscsi.write)
```


```python
nvmewrite[["iops", "clat_ns.percentile.99.000000", "clat_ns.percentile.99.990000"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>iops</th>
      <th>clat_ns.percentile.99.000000</th>
      <th>clat_ns.percentile.99.990000</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>100.000000</td>
      <td>100.000000</td>
      <td>100.00000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>9949.596065</td>
      <td>7360.000000</td>
      <td>26691.84000</td>
    </tr>
    <tr>
      <th>std</th>
      <td>772.030858</td>
      <td>729.201805</td>
      <td>32720.19217</td>
    </tr>
    <tr>
      <th>min</th>
      <td>7975.857243</td>
      <td>5472.000000</td>
      <td>13376.00000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>9362.840069</td>
      <td>6816.000000</td>
      <td>19392.00000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>9980.297843</td>
      <td>7328.000000</td>
      <td>23680.00000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>10593.706663</td>
      <td>7904.000000</td>
      <td>24960.00000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>11349.265621</td>
      <td>9536.000000</td>
      <td>292864.00000</td>
    </tr>
  </tbody>
</table>
</div>




```python
pvscsiwrite[["iops", "clat_ns.percentile.99.000000", "clat_ns.percentile.99.990000"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>iops</th>
      <th>clat_ns.percentile.99.000000</th>
      <th>clat_ns.percentile.99.990000</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>100.000000</td>
      <td>100.0000</td>
      <td>100.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>9873.937252</td>
      <td>7928.9600</td>
      <td>25000.960000</td>
    </tr>
    <tr>
      <th>std</th>
      <td>589.971377</td>
      <td>719.7012</td>
      <td>27319.749169</td>
    </tr>
    <tr>
      <th>min</th>
      <td>8592.159819</td>
      <td>5792.0000</td>
      <td>14784.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>9451.403565</td>
      <td>7520.0000</td>
      <td>18944.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>9860.497141</td>
      <td>8032.0000</td>
      <td>22656.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>10365.191715</td>
      <td>8384.0000</td>
      <td>24768.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>10986.865887</td>
      <td>9280.0000</td>
      <td>292864.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
thinsync = pd.json_normalize(nvme[nvme.jobname.str.contains("etcd[b-f]1$")].sync)
thicksync = pd.json_normalize(nvme[nvme.jobname.str.contains("etcd[g-k]1$")].sync)
```


```python
thinsync[["lat_ns.mean", "lat_ns.max", "lat_ns.percentile.99.000000", "lat_ns.percentile.99.990000"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>lat_ns.mean</th>
      <th>lat_ns.max</th>
      <th>lat_ns.percentile.99.000000</th>
      <th>lat_ns.percentile.99.990000</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>5.000000</td>
      <td>5.000000e+00</td>
      <td>5.000000</td>
      <td>5.000000e+00</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>104832.291658</td>
      <td>5.575523e+06</td>
      <td>152166.400000</td>
      <td>2.454323e+06</td>
    </tr>
    <tr>
      <th>std</th>
      <td>5070.566059</td>
      <td>3.867661e+06</td>
      <td>8856.268108</td>
      <td>2.381041e+05</td>
    </tr>
    <tr>
      <th>min</th>
      <td>98944.189702</td>
      <td>3.062894e+06</td>
      <td>142336.000000</td>
      <td>2.277376e+06</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>99726.705253</td>
      <td>3.072479e+06</td>
      <td>144384.000000</td>
      <td>2.277376e+06</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>107914.255747</td>
      <td>3.145623e+06</td>
      <td>152576.000000</td>
      <td>2.310144e+06</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>107978.953477</td>
      <td>6.687374e+06</td>
      <td>158720.000000</td>
      <td>2.605056e+06</td>
    </tr>
    <tr>
      <th>max</th>
      <td>109597.354113</td>
      <td>1.190925e+07</td>
      <td>162816.000000</td>
      <td>2.801664e+06</td>
    </tr>
  </tbody>
</table>
</div>




```python
thicksync[["lat_ns.mean", "lat_ns.max", "lat_ns.percentile.99.000000", "lat_ns.percentile.99.990000"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>lat_ns.mean</th>
      <th>lat_ns.max</th>
      <th>lat_ns.percentile.99.000000</th>
      <th>lat_ns.percentile.99.990000</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>5.000000</td>
      <td>5.000000e+00</td>
      <td>5.000000</td>
      <td>5.000000e+00</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>97383.870500</td>
      <td>4.569903e+06</td>
      <td>154624.000000</td>
      <td>1.593344e+06</td>
    </tr>
    <tr>
      <th>std</th>
      <td>10800.738111</td>
      <td>1.962739e+06</td>
      <td>14114.865922</td>
      <td>4.985692e+05</td>
    </tr>
    <tr>
      <th>min</th>
      <td>87303.076947</td>
      <td>3.128282e+06</td>
      <td>134144.000000</td>
      <td>1.044480e+06</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>89456.333110</td>
      <td>3.137223e+06</td>
      <td>148480.000000</td>
      <td>1.089536e+06</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>95735.035326</td>
      <td>3.144086e+06</td>
      <td>156672.000000</td>
      <td>1.777664e+06</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>99924.285753</td>
      <td>6.713883e+06</td>
      <td>162816.000000</td>
      <td>1.908736e+06</td>
    </tr>
    <tr>
      <th>max</th>
      <td>114500.621364</td>
      <td>6.726039e+06</td>
      <td>171008.000000</td>
      <td>2.146304e+06</td>
    </tr>
  </tbody>
</table>
</div>




```python
thinsync2 = pd.json_normalize(nvme[nvme.jobname.str.contains("etcd[b-f][2-9]$")].sync)
thicksync2 = pd.json_normalize(nvme[nvme.jobname.str.contains("etcd[g-k][2-9]$")].sync)
```


```python
thinsync2[["lat_ns.mean", "lat_ns.max", "lat_ns.percentile.99.000000", "lat_ns.percentile.99.990000"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>lat_ns.mean</th>
      <th>lat_ns.max</th>
      <th>lat_ns.percentile.99.000000</th>
      <th>lat_ns.percentile.99.990000</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>40.000000</td>
      <td>4.000000e+01</td>
      <td>40.000000</td>
      <td>4.000000e+01</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>99799.849235</td>
      <td>3.312532e+06</td>
      <td>148953.600000</td>
      <td>1.868493e+06</td>
    </tr>
    <tr>
      <th>std</th>
      <td>8701.447392</td>
      <td>7.878599e+05</td>
      <td>12427.454827</td>
      <td>6.237317e+05</td>
    </tr>
    <tr>
      <th>min</th>
      <td>83974.174907</td>
      <td>2.467324e+06</td>
      <td>120320.000000</td>
      <td>5.529600e+05</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>94703.232247</td>
      <td>3.134482e+06</td>
      <td>139776.000000</td>
      <td>1.187840e+06</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>101460.783050</td>
      <td>3.149732e+06</td>
      <td>150528.000000</td>
      <td>2.023424e+06</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>105581.694785</td>
      <td>3.161808e+06</td>
      <td>156672.000000</td>
      <td>2.310144e+06</td>
    </tr>
    <tr>
      <th>max</th>
      <td>121141.768381</td>
      <td>6.831122e+06</td>
      <td>175104.000000</td>
      <td>2.998272e+06</td>
    </tr>
  </tbody>
</table>
</div>




```python
thicksync2[["lat_ns.mean", "lat_ns.max", "lat_ns.percentile.99.000000", "lat_ns.percentile.99.990000"]].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>lat_ns.mean</th>
      <th>lat_ns.max</th>
      <th>lat_ns.percentile.99.000000</th>
      <th>lat_ns.percentile.99.990000</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>40.000000</td>
      <td>4.000000e+01</td>
      <td>40.000000</td>
      <td>4.000000e+01</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>93235.392041</td>
      <td>3.227419e+06</td>
      <td>145216.000000</td>
      <td>1.213235e+06</td>
    </tr>
    <tr>
      <th>std</th>
      <td>6129.251061</td>
      <td>9.281568e+05</td>
      <td>11188.971567</td>
      <td>4.933937e+05</td>
    </tr>
    <tr>
      <th>min</th>
      <td>83685.344143</td>
      <td>1.929561e+06</td>
      <td>121344.000000</td>
      <td>3.993600e+05</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>88444.031665</td>
      <td>3.107254e+06</td>
      <td>136192.000000</td>
      <td>9.687040e+05</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>92522.881954</td>
      <td>3.128838e+06</td>
      <td>144384.000000</td>
      <td>1.146880e+06</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>96470.304820</td>
      <td>3.149378e+06</td>
      <td>151040.000000</td>
      <td>1.347584e+06</td>
    </tr>
    <tr>
      <th>max</th>
      <td>110654.953904</td>
      <td>6.968548e+06</td>
      <td>171008.000000</td>
      <td>2.670592e+06</td>
    </tr>
  </tbody>
</table>
</div>




```python

```
