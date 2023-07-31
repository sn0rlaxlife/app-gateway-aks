# Application Gateway for Containers in Azure Kubernetes Service
Deployment of AKS with Application Gateway for Containers
<br> Application Gateway for Containers is in preview this is shortening the Quick-start in the docs by using bash shell scripts</br>

<h1>Quick Start</h1>
<p>Start with logging into your azure account and clone the repository below</p>
<code>git clone https://github.com/sn0rlaxlife/app-gateway-aks.git</code>
<br><p>Start with registering the providers by using the providers.sh</p></br>
<pre class="no translate">
<code>chmod +x providers.sh</code>
<code>./providers.sh</code>
</pre>

<br><p>Next we need to start with creating our AKS cluster</p></br>
<pre class="no translate">
<code>chmod +x aks.sh</code>
<code>./aks.sh</code>
</pre>

<br><p> Next we deploy Workload.sh </p></br>
<pre class="no translate">
<code>chmod +x workload.sh
      ./workload.sh </code>
</pre>

<p>Then we will deploy with our deploy.sh script</p>
<pre class="no translate">
<code>chmod +x deploy.sh
      ./deploy.sh</code>
</pre>
<h3>Delegating permissions to managed identity</h3>      
<p>This associates the Application Load Balancer Controller ability to provision Application Gateway for Container resources and to join the subnet intended for the Application Gateway for Containers association resource</p>
<pre class="no translate">
<code>chmod +x delegate.sh
      ./delegate.sh</code>
</pre>
