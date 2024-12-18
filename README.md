# WebRecon

### Project Summary: Subdomain Reconnaissance and Web Screenshot Automation

This project is a comprehensive **subdomain enumeration** and **web reconnaissance** automation process using three key tools:

1. **Go (Programming Language)**: 
   - **Installation and Setup**: The Go programming language is installed first, as it is required for running tools like **Subfinder** and **Httprobe**. The script ensures Go is installed correctly, sets the appropriate environment variables, and verifies the installation.
   - **Purpose**: Go is used to build the executables for various security tools in the project.

2. **Subfinder**: 
   - **Function**: Subfinder is a fast and powerful subdomain enumeration tool that discovers subdomains for a given domain using multiple data sources. 
   - **Usage**: The installation script installs **Subfinder** using Go, and the reconnaissance script (`recon.sh`) invokes **Subfinder** to find subdomains of the target domain, outputting them to a file for further processing.
   
3. **Httprobe**: 
   - **Function**: Httprobe is a tool designed to quickly check if the discovered subdomains are live and serving HTTP or HTTPS content.
   - **Usage**: In the reconnaissance process, **Httprobe** is used to filter out inactive subdomains. It checks which subdomains respond to web requests and outputs a list of live subdomains.

4. **EyeWitness**:
   - **Function**: EyeWitness is a tool used to take screenshots of websites, which is especially useful in security testing for visually inspecting web applications.
   - **Usage**: After filtering live subdomains, **EyeWitness** is invoked to take screenshots of these active subdomains. This visual information is useful for identifying the type of web services running on the subdomains and for penetration testing.

### Workflow Overview:
- **Installation (`install.sh`)**: 
   - Installs the necessary software (Go, Subfinder, Httprobe, and EyeWitness) and configures the environment for these tools to run correctly on a Linux machine.
   - Ensures that Go is installed and properly added to the system’s PATH for running Go-based tools like **Subfinder** and **Httprobe**.

- **Reconnaissance (`recon.sh`)**:
   - Takes a domain as input and performs the following actions:
     1. **Subdomain Enumeration**: Uses **Subfinder** to discover subdomains of the given domain.
     2. **Probing for Live Subdomains**: Uses **Httprobe** to check which of these subdomains are live (respond to HTTP/HTTPS).
     3. **Screenshot Capture**: Uses **EyeWitness** to take screenshots of the live subdomains, providing a visual representation of the web services.


### Instructions for Usage:

1. **`install.sh`**:  
   - This script will install Go, Subfinder, Httprobe, and EyeWitness.  
   - Run the installation script first:
     ```bash
     bash install.sh
     ```

2. **`recon.sh`**:  
   - After installing all necessary tools, you can use the `recon.sh` script to perform reconnaissance on any domain by providing the domain name as an argument:
     ```bash
     bash recon.sh <domain.com.au>
     ```
     This will:
     - Discover subdomains using `subfinder`.
     - Check live subdomains using `httprobe`.
     - Take screenshots of the live subdomains using `EyeWitness`.

### Notes:
- Make sure that your system has Python 3.x installed, as **EyeWitness** requires Python to run.
- You may need to adjust the Python path for **EyeWitness** if it's installed in a custom location.
- `recon.sh` assumes EyeWitness is located at `/opt/EyeWitness/`, but you might need to adjust the path depending on where you cloned the repository.

Reference :

https://github.com/projectdiscovery/subfinder?tab=readme-ov-file

https://docs.projectdiscovery.io/tools/subfinder/usage

https://github.com/NilangaPerera/OSINT-Subdomain-Recon-Tool/tree/main

https://github.com/owasp-amass/amass?tab=readme-ov-file
