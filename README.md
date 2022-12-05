# mp2t-error-detector
Bash script for detecting mp2t errors in a collection of pcap files
## Installation
### Prequisites
- Tshark must be in your path
- The multiple pcap files should be part of one sequence, i.e the program generating them should have sequentially split them up as part of the writing to file process. This is 
usually the default behaviour.
### Program Usage
Copy the script into the folder containing all your PCAP files. Ensure only your PCAP files and the script are in the folder.
## Usage
Run the BASH script and then open the output file. The output file will only contain the packets where a mp2t sequence error exists.
## History
TODO: Write history
## Credits
Ruwan Samaranayake
## License
Refer to license file in repository
