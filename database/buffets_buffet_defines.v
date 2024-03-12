// 
// Author: Kartik Hegde (kartikhegde.net)
//
// Copyright (c) 2019 Authors of "Buffets: An Efficient and Composable Storage Idiom for Explicit Decoupled Data
// Orchestration".
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

/*
*  Defines File includes all the definitions to control parameters in buffets.
*/

`define IDX_WIDTH       8
`define DATA_WIDTH      32
`define SIZE            2 ** `IDX_WIDTH - 1
`define SEPARATE_WRITE_PORTS    1
`define SUPPORTS_UPDATE         1
`define READREQ_FIFO_DEPTH      8
`define UPDATE_FIFO_DEPTH       8
`define READRESP_FIFO_DEPTH     8
`define PUSH_FIFO_DEPTH         8

`define SCOREBOARD_SIZE         8
