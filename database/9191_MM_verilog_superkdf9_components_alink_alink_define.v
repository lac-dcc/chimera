// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

`define PHY_NUM 5//32

`define TX_FIFO_DEPTH 1024
`define TX_TASKID_LEN (2+1+1) //TaskID_H+TaskID_L+STEP+Timer = 4word
`define TX_HASH_LEN 17//word
//`define TX_DATA_LEN (TX_TASKID_LEN+TX_HASH_LEN) //word
`define TX_DATA_LEN (17+2) //word

`define RX_FIFO_DEPTH 512
`define RX_DATA_LEN 5 //word

`define TX_PHY_TIMING 14
