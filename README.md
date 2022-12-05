# mp2t-error-detector
Bash script for detecting mp2t errors in a collection of pcap files. Normally such analysis is challenging due to the volume of packets and the size of the packet data.

This program iterates through a collection of sequentially named PCAP files (an output of Wireshark for instance) and runs the output against tshark for input errors. All the input error packets are packaged in a new PCAP. This new PCAP is significantly smaller and easier to analyze. 

Using this script various capture points on a network can be checked to see if errors are present, allowing one to narrow down the problem.

## Installation
### Prequisites
- Tshark must be in your path
- The multiple pcap files should be part of one sequence, i.e the program generating them should have sequentially split them up as part of the writing to file process. This is 
usually the default behaviour.
### Program Usage
Copy the script into the folder containing all your PCAP files. Ensure only your PCAP files and the script are in the folder.
## Usage
Run the BASH script (in previously aforementioned directory) and then open the output file. The output file will only contain the packets where a mp2t sequence error exists.
## Background
### Problem Description
Streaming errors can be difficult to narrow down in a network due to the sheer volume of data being sent. That is an end user/app support technician can report drops, but as to where these drops are occurring is the question? Packet capturing is required but this proves a challenge.

### Capture and Analysis Techniques
Main problems with Traditional capture of MP2T streams:

- Capturing traffic in a fashion where the data integrity is maintained.
- Analyzing the captured data.

The first of these issues can be addressed by using a dedicated piece of capture equipment. A commercial solution to laptop is often preferred, but both can work for you.

- Firstly ensure that whichever device you are SPANing or tapping, where possible apply a filter on the device itself (ensuring the filter is within the device's operating specs). This can clean up the excess data before you have to process it. For example filtering by source, destination IP or Port can significantly reduce file sizes.
- Secondly shortening the SNAP length for a captured packet is possible as long as you do not affect the MP2T data (especially the CC) field. You could do this if space is a problem, but I would advise against it.
- If you are using a dedicated capture device, ensure there is enough space for the capture file (also these devices allow a level of filtering here as well).
- If you are using a laptop, extra care needs to be taken so that no false positives are triggered. Ensure the laptop has a harddrive that has a fast write speed (SSD). Do not intiate a capture with GUI based tool. This chews up memory and you also have a greater risk of the program crashing. Normally you would need to set up some a collection of files for the capture, eg capture 200 files at 1GB each, a crash here would be problematic. It is much better to use dumpcap (which comes with wireshark). It is lightweight and if you set a large capture buffer (and you need to) dropped packets will be minimized. Dropped packets during capturing are usually due to the hardisk not being capable of keeping up with the network input. Allocate as much memory as you can towards this capture.

The second issue pertaining to analysis:

- The reason you would have 200 files and not 1 200GB file is that when you need to open it up for analysis all your memory could be wiped out. Also processing even a 1GB file takes time in Wireshark.
- The shell script then can summarise these 200 files into a file that is only a few MegaBytes big. Timestamps are preserved, so the detail of the events are there and graphing the output is very insightful.


## History
TODO: Write history
## Credits
Ruwan Samaranayake
## License
Refer to license file in repository
