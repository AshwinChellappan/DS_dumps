#!/usr/bin/env python
# coding: utf-8

# <table align="center" width=100%>
#     <tr>
#         <td width="15%">
#             <img src="in_class.png">
#         </td>
#         <td>
#             <div align="center">
#                 <font color="#21618C" size=8px>
#                     <b> Inclass - Lab <br>(Day 1)
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# ### About the dataset (Adult Income Data)
# 
# The dataset contains information about the individuals' age, gender, and several attributes affecting the income of a person. <br> Attribute information:
# 
# **age:** Age of an individual
# 
# **workclass:** Working class of the individual
# 
# **fnlwgt:** Weights based on the demographic characteristics
# 
# **education:** Highest education of the individual
# 
# **education.num:** Education encoded with unique numbers
# 
# **marital.status:** Marital status of the individual
# 
# **occupation:** Occupation of the individual
# 
# **relationship:** Relation of the individual in the family
# 
# **race:** Race of the individual
# 
# **sex:** Gender of the individual (0 = Male, 1 = Female)
# 
# **capital.gain:** Gain amount of the individual
# 
# **capital.loss:** Loss amount of the individual
# 
# **hours.per.week:** Working hours per week
# 
# **native.country:** The native country of the individual
# 
# **income:** Income of the individual

# ##  Table of Content
# 
# 1. **[Understand the Dataset](#data)**
# 2. **[Measures of Central Tendency](#ct)**
# 3. **[Measures of Dispersion](#md)**
# 4. **[Distribution of the Data](#dist)**
# 5. **[Skewness and kurtosis](#sk)**
# 6. **[Correlation](#corr)**

# **Import the required libraries**

# In[2]:


# type your code here

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# **Load the adults income dataset and print first five observations**

# In[3]:


# type your code here
df=pd.read_csv('adult_income.csv')
df.head()


# ### Let's begin with some hands-on practice exercises

# <a id="data"> </a>
# ## 1. Understand the Dataset

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>1. Find out the numerical and categorical variables in the data. If any variable is wrongly identified, do the needful
# </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[15]:


# type your code here
df.info()
df.dtypes
df['sex']=df['sex'].astype('object')


# <a id="ct"> </a>
# ## 2. Measures of Central Tendency

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>2. What is the average age of males and females in the data?</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[18]:


# type your code here
print(df['age'].mean())
df.groupby(['sex'])[['age']].mean()


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>3. What is the value under which 95% of the capital gain would lie? </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[32]:


# type your code here
df['capital.gain'].quantile(0.95)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>4. Identify the qualification of most of the individuals </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[33]:


# type your code here
df.head()
df['education'].mode()


# In[37]:


df['education'].value_counts()[0] #to get count
df['education'].value_counts().index[0] # to get position


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>5. Find the middle most observation of age for different working class</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[40]:


# type your code here
df.groupby(['workclass'])[['age']].median()


# In[38]:


df.head()


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>6. Compare the mean and trimmed mean of capital gain and comment on the presence of outliers</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[ ]:


# type your code here
print(df['capital.gain'].mean())

from scipy import stats 
print(stats.tmean(df['capital.gain']))

trim_mean(df['capital.gain'],proportiontocut=0.01)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>7. What is the percentage of the Asian-Pac-Islander race people in the data? </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[15]:


df.head()


# In[20]:


# type your code here
df['race'].value_counts()/len(df)*100


# <a id="md"> </a>
# ## 3. Measures of Dispersion

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>8. Which occupation has more variability in the working hours</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[28]:


# type your code here

df.head()
#df['occupation'].var()
df.groupby(['occupation'])['hours.per.week'].var()
##Farming-fishing 


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b> 9. What is the range of the middle 50% of working hours per week?</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[10]:


# type your code here
IQR=df['hours.per.week'].quantile(0.75)-df['hours.per.week'].quantile(0.25)
IQR


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>10. Are there any variables which can be excluded from further analysis based on their variability?</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[12]:


# type your code here
df1=df.select_dtypes(include=np.number)
df1.std()


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>11. Find the percentage of variation in work hours for each workclass. Give an appropriate interpretation</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[23]:


# type your code here
df.head()
mu=df.groupby('workclass')['hours.per.week'].mean()
sigma=df.groupby('workclass')['hours.per.week'].std()
cv=sigma/np.abs(mu)*100
cv


# In[19]:


df.head()


# <a id="dist"> </a>
# ## 4. Distribution of the Data

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>12. Define a function to plot the categories of the variable and find the category with highest frequency</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[31]:


# type your code here
df.head()

def get_plot(variable):
    plt.figure(figsize=(15,10))
    sns.countplot(x=df[variable])
    plt.show()
get_plot('marital.status')


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>13. Is there any variable which is normally distributed?</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[15]:


# type your code here
plt.rcParams['figure.figsize']=[18,8]
df.plot(kind='density',subplots=True,sharex=False,layout=(3,4))


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>14. Identify the working class for most of the population in the data</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[7]:


# type your code here
df.head()
plt.figure(figsize=(15,10))
sns.countplot(x=df['workclass'])


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>15. For how much time are most of the individuals working per week?
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[11]:


# type your code here

sns.displot(a=df['hours.per.week']) #density plot ,most people working 40 hours


# <a id="sk"> </a>
# ## 5. Skewness and kurtosis

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>16. Is there any negatively skewed feature. Support your answer with a metric and the plot</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[19]:


# type your code here
df.skew()
sns.displot(a=df['education.num'])


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>17. Find the kurtosis of all the variables, and give appropriate interpretation</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[22]:


# type your code here
df.head()
df.kurt()
sns.distplot(a=df['age'])


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>18. Identify the presence of extreme values in age using visualization techniques
# </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[27]:


# type your code here
df['age'].max()
sns.boxplot(x=df['age']) 
#Ages greater than 75


# <a id="corr"> </a>
# ## 6. Correlation

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>19. Is there any effect of age on the working hours of a person?</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[34]:


# type your code here
df.head()
df[['age','hours.per.week']].corr()
# Since closer to zero ,either weak or no corelation


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>20. Visualize the upper triangular correlation matrix</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[38]:


# type your code here
mask=np.zeros_like(df.corr())# create 6x6 matrix
mask[np.tril_indices_from(mask,k=-1)]=True
sns.heatmap(df.corr(),annot=True,mask=mask)


# In[41]:


import os
notebook_path = os.path.abspath("EDA - In-Class Lab Exercise (Day 1) - Questions [v3.0 - 190820].ipynb")
notebook_path


# In[43]:


import os

c.NotebookApp.notebook_dir = os.path.expanduser('D:\python_file')


# In[45]:


os.chdir('D:\python_file')

