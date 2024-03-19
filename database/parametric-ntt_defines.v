/*
Copyright 2020, Ahmet Can Mert <ahmetcanmert@sabanciuniv.edu>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

`timescale 1 ns / 1 ps

// ------------------------------------------------
// User parameters
// -- K: DATA_SIZE_ARB
// -- n: RING_SIZE
// -- B: PE_NUMBER

`define DATA_SIZE_ARB   14
`define RING_SIZE       512
`define PE_NUMBER       1

// ------------------------------------------------
// Parameters for integer multiplication

`define DATA_SIZE       (1 << ($clog2(`DATA_SIZE_ARB)))
`define DATA_SIZE_DEPTH ($clog2(`DATA_SIZE))

`define GENERIC         (1 << (`DATA_SIZE_DEPTH - 4))
`define CSA_LEVEL       ((`DATA_SIZE > 16) ? (`GENERIC*`GENERIC-2) : 0)

`define INTMUL_DELAY    3

// ------------------------------------------------
// Works for K between 9-bit to 64-bit
// Parameters for modular reduction

`define RING_DEPTH      ($clog2(`RING_SIZE))
`define W_SIZE          ((`RING_DEPTH)+1)
`define L_SIZE          ((`DATA_SIZE_ARB > `W_SIZE) ? ((`DATA_SIZE_ARB > (`W_SIZE * 2)) ? ((`DATA_SIZE_ARB > (`W_SIZE * 3)) ? ((`DATA_SIZE_ARB > (`W_SIZE * 4)) ? ((`DATA_SIZE_ARB > (`W_SIZE * 5)) ? ((`DATA_SIZE_ARB > (`W_SIZE * 6)) ? ((`DATA_SIZE_ARB > (`W_SIZE * 7)) ? 8 : 7) : 6) : 5) : 4) : 3) : 2) : 1)

// `define W_SIZE       ($rtoi((`RING_DEPTH)+1))
// `define L_SIZE		($rtoi($ceil((`DATA_SIZE_ARB*1.0)/(`W_SIZE*1.0))))

`define MODRED_DELAY	((`L_SIZE)*2 + 1)

// ------------------------------------------------
// System parameters

`define PE_DEPTH        ($clog2(`PE_NUMBER))
`define STAGE_DELAY     5

`define R               ($rtoi(`W_SIZE * `L_SIZE))

// ------------------------------------------------
