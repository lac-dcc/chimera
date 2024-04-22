library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.entropy_pkg.all;
use work.arithmetic_pkg.all;

package fse_tables_pkg is
-------------------------------------
----------For literal length---------
-------------------------------------	
	constant LL_STATE_TABLE_SIZE 		: integer 			:= 512; --defined in SW
	constant LL_STATE_TABLE_SIZE_LOG	: integer			:= work.arithmetic_pkg.clog2(LL_STATE_TABLE_SIZE);
	constant LL_DELTA_NBITS_WIDTH		: integer			:= 20; --it seems that 20 bits are enough
	
	subtype ll_delta_find_state_t is unsigned(LL_STATE_TABLE_SIZE_LOG downto 0); -- use an extra bit to store sign, it is essentially signed number
	
	subtype ll_delta_nb_bits_t is unsigned(LL_DELTA_NBITS_WIDTH-1 downto 0);

	constant LL_DELTA_FIND_STATE_SHIFT	: integer:= LL_STATE_TABLE_SIZE; -- add a number to make the number positive
	
	type ll_state_table_t	is array(LL_STATE_TABLE_SIZE-1 downto 0) of unsigned(LL_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	type ll_symbol_delta_find_state_table_t  is array(LIT_LENGTH_CODE_MAX downto 0) of ll_delta_find_state_t;
	type ll_symbol_delta_nb_bits_table_t is array(LIT_LENGTH_CODE_MAX downto 0) of ll_delta_nb_bits_t;
	
	type FSE_encode_ll2bits_return_t is record
		updated_state	: unsigned(LL_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		nb_bits_out		: unsigned(LL_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
	end record;
	
			
	function fse_encode_ll_bits (
			old_state			: unsigned;
			delta_find_state	: unsigned;
			delta_nb_bits		: unsigned) 
			return FSE_encode_ll2bits_return_t;
			
	function fse_encode_ll_bits_init (
			delta_find_state	: unsigned;
			delta_nb_bits		: unsigned) 
			return FSE_encode_ll2bits_return_t;

-------------------------------------
-------------For match length--------
-------------------------------------
	constant ML_STATE_TABLE_SIZE 		: integer 			:= 512; --defined in SW
	constant ML_STATE_TABLE_SIZE_LOG	: integer			:= work.arithmetic_pkg.clog2(ML_STATE_TABLE_SIZE);
	constant ML_DELTA_NBITS_WIDTH		: integer			:= 20; --it seems that 20 bits are enough
	
	subtype ml_delta_find_state_t is unsigned(ML_STATE_TABLE_SIZE_LOG downto 0); -- use an extra bit to store sign, it is essentially signed number
	
	subtype ml_delta_nb_bits_t is unsigned(ML_DELTA_NBITS_WIDTH-1 downto 0);
	
	constant ML_DELTA_FIND_STATE_SHIFT	: integer:= ML_STATE_TABLE_SIZE; -- add a number to make the number positive
	
	type ml_state_table_t	is array(ML_STATE_TABLE_SIZE-1 downto 0) of unsigned(ML_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	type ml_symbol_delta_find_state_table_t  is array(MATCH_LENGTH_CODE_MAX downto 0) of ML_delta_find_state_t;
	type ml_symbol_delta_nb_bits_table_t is array(MATCH_LENGTH_CODE_MAX downto 0) of ml_delta_nb_bits_t;
	
	type FSE_encode_ml2bits_return_t is record
		updated_state	: unsigned(ML_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		nb_bits_out		: unsigned(ML_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
	end record;
	
	function fse_encode_ml_bits (
			old_state			: unsigned;
			delta_find_state	: unsigned;
			delta_nb_bits		: unsigned) 
			return FSE_encode_ml2bits_return_t;
			
	function fse_encode_ml_bits_init (
			delta_find_state	: unsigned;
			delta_nb_bits		: unsigned) 
			return FSE_encode_ml2bits_return_t;
	
-------------------------------------
-------------For match offset--------
-------------------------------------
	constant OFF_STATE_TABLE_SIZE 		: integer 			:= 256; --defined in SW
	constant OFF_STATE_TABLE_SIZE_LOG	: integer			:= work.arithmetic_pkg.clog2(OFF_STATE_TABLE_SIZE);
	constant OFF_DELTA_NBITS_WIDTH		: integer			:= 20;

	subtype off_delta_find_state_t is unsigned(OFF_STATE_TABLE_SIZE_LOG downto 0); -- use an extra bit to store sign, it is essentially signed number

	subtype off_delta_nb_bits_t is unsigned(OFF_DELTA_NBITS_WIDTH-1 downto 0);

	constant OFF_DELTA_FIND_STATE_SHIFT	: integer:= OFF_STATE_TABLE_SIZE;

	type off_state_table_t	is array(OFF_STATE_TABLE_SIZE-1 downto 0) of unsigned(OFF_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	type off_symbol_delta_find_state_table_t  is array(MATCH_OFFSET_CODE_MAX downto 0) of off_delta_find_state_t;
	type off_symbol_delta_nb_bits_table_t is array(MATCH_OFFSET_CODE_MAX downto 0) of off_delta_nb_bits_t;
	
	type FSE_encode_off2bits_return_t is record
		updated_state	: unsigned(OFF_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		nb_bits_out		: unsigned(OFF_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
	end record;

	function fse_encode_off_bits (
			old_state			: unsigned;
			delta_find_state	: unsigned;
			delta_nb_bits		: unsigned) 
			return FSE_encode_off2bits_return_t;
			
	function fse_encode_off_bits_init (
			delta_find_state	: unsigned;
			delta_nb_bits		: unsigned) 
			return FSE_encode_off2bits_return_t;
-------------------------------------
-----Tables for literal length-------
-------------------------------------
	constant ll_state_table_aucm	: ll_state_table_t := (
			x"03f0", -- 511
			x"03f1", -- 510
			x"03f2", -- 509
			x"03f3", -- 508
			x"03f4", -- 507
			x"03f5", -- 506
			x"03f6", -- 505
			x"03f7", -- 504
			x"03f8", -- 503
			x"03f9", -- 502
			x"03fa", -- 501
			x"03fb", -- 500
			x"03fc", -- 499
			x"03fd", -- 498
			x"02bd", -- 497
			x"03fe", -- 496
			x"037a", -- 495
			x"03ff", -- 494
			x"02f4", -- 493
			x"0237", -- 492
			x"03b1", -- 491
			x"026e", -- 490
			x"03e8", -- 489
			x"032b", -- 488
			x"0362", -- 487
			x"02a5", -- 486
			x"021f", -- 485
			x"0399", -- 484
			x"02dc", -- 483
			x"0256", -- 482
			x"03d0", -- 481
			x"034a", -- 480
			x"0313", -- 479
			x"028d", -- 478
			x"02c4", -- 477
			x"0207", -- 476
			x"03b8", -- 475
			x"0381", -- 474
			x"0332", -- 473
			x"02fb", -- 472
			x"0275", -- 471
			x"023e", -- 470
			x"03ef", -- 469
			x"03d7", -- 468
			x"03a0", -- 467
			x"0369", -- 466
			x"0351", -- 465
			x"031a", -- 464
			x"02e3", -- 463
			x"02ac", -- 462
			x"0294", -- 461
			x"025d", -- 460
			x"0226", -- 459
			x"0388", -- 458
			x"0302", -- 457
			x"02cb", -- 456
			x"0245", -- 455
			x"020e", -- 454
			x"03de", -- 453
			x"03c6", -- 452
			x"03bf", -- 451
			x"03a7", -- 450
			x"038f", -- 449
			x"0370", -- 448
			x"0358", -- 447
			x"0340", -- 446
			x"0339", -- 445
			x"0321", -- 444
			x"0309", -- 443
			x"02ea", -- 442
			x"02d2", -- 441
			x"02b3", -- 440
			x"029b", -- 439
			x"0283", -- 438
			x"027c", -- 437
			x"0264", -- 436
			x"024c", -- 435
			x"022d", -- 434
			x"0215", -- 433
			x"03e5", -- 432
			x"03cd", -- 431
			x"03ae", -- 430
			x"0396", -- 429
			x"0377", -- 428
			x"035f", -- 427
			x"0328", -- 426
			x"0310", -- 425
			x"02f1", -- 424
			x"02d9", -- 423
			x"02ba", -- 422
			x"02a2", -- 421
			x"028a", -- 420
			x"026b", -- 419
			x"0253", -- 418
			x"0234", -- 417
			x"021c", -- 416
			x"03ec", -- 415
			x"03b5", -- 414
			x"037e", -- 413
			x"0366", -- 412
			x"0347", -- 411
			x"032f", -- 410
			x"02f8", -- 409
			x"02c1", -- 408
			x"02a9", -- 407
			x"0272", -- 406
			x"023b", -- 405
			x"0223", -- 404
			x"0204", -- 403
			x"03db", -- 402
			x"03d4", -- 401
			x"03bc", -- 400
			x"03a4", -- 399
			x"039d", -- 398
			x"038c", -- 397
			x"0385", -- 396
			x"036d", -- 395
			x"0355", -- 394
			x"034e", -- 393
			x"0336", -- 392
			x"031e", -- 391
			x"0317", -- 390
			x"02ff", -- 389
			x"02e7", -- 388
			x"02e0", -- 387
			x"02cf", -- 386
			x"02c8", -- 385
			x"02b0", -- 384
			x"0298", -- 383
			x"0291", -- 382
			x"0279", -- 381
			x"0261", -- 380
			x"025a", -- 379
			x"0242", -- 378
			x"022a", -- 377
			x"0212", -- 376
			x"020b", -- 375
			x"03e9", -- 374
			x"03e2", -- 373
			x"03d1", -- 372
			x"03ca", -- 371
			x"03c3", -- 370
			x"03b9", -- 369
			x"03b2", -- 368
			x"03ab", -- 367
			x"039a", -- 366
			x"0393", -- 365
			x"0382", -- 364
			x"037b", -- 363
			x"0374", -- 362
			x"0363", -- 361
			x"035c", -- 360
			x"034b", -- 359
			x"0344", -- 358
			x"033d", -- 357
			x"032c", -- 356
			x"0325", -- 355
			x"0314", -- 354
			x"030d", -- 353
			x"0306", -- 352
			x"02fc", -- 351
			x"02f5", -- 350
			x"02ee", -- 349
			x"02dd", -- 348
			x"02d6", -- 347
			x"02c5", -- 346
			x"02be", -- 345
			x"02b7", -- 344
			x"02a6", -- 343
			x"029f", -- 342
			x"028e", -- 341
			x"0287", -- 340
			x"0280", -- 339
			x"0276", -- 338
			x"026f", -- 337
			x"0268", -- 336
			x"0257", -- 335
			x"0250", -- 334
			x"0249", -- 333
			x"023f", -- 332
			x"0238", -- 331
			x"0231", -- 330
			x"0220", -- 329
			x"0219", -- 328
			x"0208", -- 327
			x"0201", -- 326
			x"03e6", -- 325
			x"03df", -- 324
			x"03d8", -- 323
			x"03ce", -- 322
			x"03c7", -- 321
			x"03c0", -- 320
			x"03af", -- 319
			x"03a8", -- 318
			x"03a1", -- 317
			x"0397", -- 316
			x"0390", -- 315
			x"0389", -- 314
			x"037f", -- 313
			x"0378", -- 312
			x"0371", -- 311
			x"036a", -- 310
			x"0360", -- 309
			x"0359", -- 308
			x"0352", -- 307
			x"0348", -- 306
			x"0341", -- 305
			x"033a", -- 304
			x"0333", -- 303
			x"0329", -- 302
			x"0322", -- 301
			x"031b", -- 300
			x"0311", -- 299
			x"030a", -- 298
			x"0303", -- 297
			x"02f9", -- 296
			x"02f2", -- 295
			x"02eb", -- 294
			x"02e4", -- 293
			x"02da", -- 292
			x"02d3", -- 291
			x"02cc", -- 290
			x"02c2", -- 289
			x"02bb", -- 288
			x"02b4", -- 287
			x"02ad", -- 286
			x"02a3", -- 285
			x"029c", -- 284
			x"0295", -- 283
			x"028b", -- 282
			x"0284", -- 281
			x"027d", -- 280
			x"026c", -- 279
			x"0265", -- 278
			x"025e", -- 277
			x"0254", -- 276
			x"024d", -- 275
			x"0246", -- 274
			x"023c", -- 273
			x"0235", -- 272
			x"022e", -- 271
			x"0227", -- 270
			x"021d", -- 269
			x"0216", -- 268
			x"020f", -- 267
			x"0205", -- 266
			x"03ed", -- 265
			x"03ea", -- 264
			x"03e3", -- 263
			x"03e0", -- 262
			x"03dc", -- 261
			x"03d9", -- 260
			x"03d5", -- 259
			x"03d2", -- 258
			x"03cb", -- 257
			x"03c4", -- 256
			x"03c1", -- 255
			x"03bd", -- 254
			x"03ba", -- 253
			x"03b6", -- 252
			x"03b3", -- 251
			x"03ac", -- 250
			x"03a9", -- 249
			x"03a5", -- 248
			x"03a2", -- 247
			x"039e", -- 246
			x"039b", -- 245
			x"0394", -- 244
			x"038d", -- 243
			x"038a", -- 242
			x"0386", -- 241
			x"0383", -- 240
			x"037c", -- 239
			x"0375", -- 238
			x"0372", -- 237
			x"036e", -- 236
			x"036b", -- 235
			x"0367", -- 234
			x"0364", -- 233
			x"035d", -- 232
			x"035a", -- 231
			x"0356", -- 230
			x"0353", -- 229
			x"034f", -- 228
			x"034c", -- 227
			x"0345", -- 226
			x"033e", -- 225
			x"033b", -- 224
			x"0337", -- 223
			x"0334", -- 222
			x"0330", -- 221
			x"032d", -- 220
			x"0326", -- 219
			x"0323", -- 218
			x"031f", -- 217
			x"031c", -- 216
			x"0318", -- 215
			x"0315", -- 214
			x"030e", -- 213
			x"0307", -- 212
			x"0304", -- 211
			x"0300", -- 210
			x"02fd", -- 209
			x"02f6", -- 208
			x"02ef", -- 207
			x"02ec", -- 206
			x"02e8", -- 205
			x"02e5", -- 204
			x"02e1", -- 203
			x"02de", -- 202
			x"02d7", -- 201
			x"02d4", -- 200
			x"02d0", -- 199
			x"02cd", -- 198
			x"02c9", -- 197
			x"02c6", -- 196
			x"02bf", -- 195
			x"02b8", -- 194
			x"02b5", -- 193
			x"02b1", -- 192
			x"02ae", -- 191
			x"02aa", -- 190
			x"02a7", -- 189
			x"02a0", -- 188
			x"029d", -- 187
			x"0299", -- 186
			x"0296", -- 185
			x"0292", -- 184
			x"028f", -- 183
			x"0288", -- 182
			x"0281", -- 181
			x"027e", -- 180
			x"027a", -- 179
			x"0277", -- 178
			x"0273", -- 177
			x"0270", -- 176
			x"0269", -- 175
			x"0266", -- 174
			x"0262", -- 173
			x"025f", -- 172
			x"025b", -- 171
			x"0258", -- 170
			x"0251", -- 169
			x"024a", -- 168
			x"0247", -- 167
			x"0243", -- 166
			x"0240", -- 165
			x"0239", -- 164
			x"0232", -- 163
			x"022f", -- 162
			x"022b", -- 161
			x"0228", -- 160
			x"0224", -- 159
			x"0221", -- 158
			x"021a", -- 157
			x"0217", -- 156
			x"0213", -- 155
			x"0210", -- 154
			x"020c", -- 153
			x"0209", -- 152
			x"0202", -- 151
			x"03ee", -- 150
			x"03eb", -- 149
			x"03e7", -- 148
			x"03e4", -- 147
			x"03e1", -- 146
			x"03dd", -- 145
			x"03da", -- 144
			x"03d6", -- 143
			x"03d3", -- 142
			x"03cf", -- 141
			x"03cc", -- 140
			x"03c9", -- 139
			x"03c8", -- 138
			x"03c5", -- 137
			x"03c2", -- 136
			x"03be", -- 135
			x"03bb", -- 134
			x"03b7", -- 133
			x"03b4", -- 132
			x"03b0", -- 131
			x"03ad", -- 130
			x"03aa", -- 129
			x"03a6", -- 128
			x"03a3", -- 127
			x"039f", -- 126
			x"039c", -- 125
			x"0398", -- 124
			x"0395", -- 123
			x"0392", -- 122
			x"0391", -- 121
			x"038e", -- 120
			x"038b", -- 119
			x"0387", -- 118
			x"0384", -- 117
			x"0380", -- 116
			x"037d", -- 115
			x"0379", -- 114
			x"0376", -- 113
			x"0373", -- 112
			x"036f", -- 111
			x"036c", -- 110
			x"0368", -- 109
			x"0365", -- 108
			x"0361", -- 107
			x"035e", -- 106
			x"035b", -- 105
			x"0357", -- 104
			x"0354", -- 103
			x"0350", -- 102
			x"034d", -- 101
			x"0349", -- 100
			x"0346", -- 99
			x"0343", -- 98
			x"0342", -- 97
			x"033f", -- 96
			x"033c", -- 95
			x"0338", -- 94
			x"0335", -- 93
			x"0331", -- 92
			x"032e", -- 91
			x"032a", -- 90
			x"0327", -- 89
			x"0324", -- 88
			x"0320", -- 87
			x"031d", -- 86
			x"0319", -- 85
			x"0316", -- 84
			x"0312", -- 83
			x"030f", -- 82
			x"030c", -- 81
			x"030b", -- 80
			x"0308", -- 79
			x"0305", -- 78
			x"0301", -- 77
			x"02fe", -- 76
			x"02fa", -- 75
			x"02f7", -- 74
			x"02f3", -- 73
			x"02f0", -- 72
			x"02ed", -- 71
			x"02e9", -- 70
			x"02e6", -- 69
			x"02e2", -- 68
			x"02df", -- 67
			x"02db", -- 66
			x"02d8", -- 65
			x"02d5", -- 64
			x"02d1", -- 63
			x"02ce", -- 62
			x"02ca", -- 61
			x"02c7", -- 60
			x"02c3", -- 59
			x"02c0", -- 58
			x"02bc", -- 57
			x"02b9", -- 56
			x"02b6", -- 55
			x"02b2", -- 54
			x"02af", -- 53
			x"02ab", -- 52
			x"02a8", -- 51
			x"02a4", -- 50
			x"02a1", -- 49
			x"029e", -- 48
			x"029a", -- 47
			x"0297", -- 46
			x"0293", -- 45
			x"0290", -- 44
			x"028c", -- 43
			x"0289", -- 42
			x"0286", -- 41
			x"0285", -- 40
			x"0282", -- 39
			x"027f", -- 38
			x"027b", -- 37
			x"0278", -- 36
			x"0274", -- 35
			x"0271", -- 34
			x"026d", -- 33
			x"026a", -- 32
			x"0267", -- 31
			x"0263", -- 30
			x"0260", -- 29
			x"025c", -- 28
			x"0259", -- 27
			x"0255", -- 26
			x"0252", -- 25
			x"024f", -- 24
			x"024e", -- 23
			x"024b", -- 22
			x"0248", -- 21
			x"0244", -- 20
			x"0241", -- 19
			x"023d", -- 18
			x"023a", -- 17
			x"0236", -- 16
			x"0233", -- 15
			x"0230", -- 14
			x"022c", -- 13
			x"0229", -- 12
			x"0225", -- 11
			x"0222", -- 10
			x"021e", -- 9
			x"021b", -- 8
			x"0218", -- 7
			x"0214", -- 6
			x"0211", -- 5
			x"020d", -- 4
			x"020a", -- 3
			x"0206", -- 2
			x"0203", -- 1
			x"0200" -- 0	
		);
	
	constant ll_symbol_delta_find_state_table_aucm : ll_symbol_delta_find_state_table_t :=(
	 		to_unsigned(510 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 35
 			to_unsigned(509 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 34
 			to_unsigned(508 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 33
 			to_unsigned(507 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 32
 			to_unsigned(506 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 31
 			to_unsigned(505 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 30
 			to_unsigned(504 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 29
 			to_unsigned(503 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 28
 			to_unsigned(502 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 27
 			to_unsigned(501 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 26
 			to_unsigned(500 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 25
 			to_unsigned(499 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 24
 			to_unsigned(498 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 23
 			to_unsigned(497 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 22
 			to_unsigned(496 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 21
 			to_unsigned(495 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 20
 			to_unsigned(494 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 19
 			to_unsigned(493 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 18
 			to_unsigned(490 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 17
 			to_unsigned(488 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 16
 			to_unsigned(486 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 15
 			to_unsigned(482 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 14
 			to_unsigned(479 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 13
 			to_unsigned(474 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 12
 			to_unsigned(474 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 11
 			to_unsigned(464 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 10
 			to_unsigned(448 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 9
 			to_unsigned(449 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 8
 			to_unsigned(412 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 7
 			to_unsigned(399 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 6
 			to_unsigned(390 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 5
 			to_unsigned(347 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 4
 			to_unsigned(277 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 3
 			to_unsigned(206 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 2
 			to_unsigned(36 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1), -- 1
 			to_unsigned(-151 + LL_DELTA_FIND_STATE_SHIFT, LL_STATE_TABLE_SIZE_LOG+1) -- 0
		);
		
	constant ll_symbol_delta_nb_bits_table_aucm :ll_symbol_delta_nb_bits_table_t :=(
			x"8fe00", -- 35
			x"8fe00", -- 34
			x"8fe00", -- 33
			x"8fe00", -- 32
			x"8fe00", -- 31
			x"8fe00", -- 30
			x"8fe00", -- 29
			x"8fe00", -- 28
			x"8fe00", -- 27
			x"8fe00", -- 26
			x"8fe00", -- 25
			x"8fe00", -- 24
			x"8fe00", -- 23
			x"8fe00", -- 22
			x"8fe00", -- 21
			x"8fe00", -- 20
			x"8fe00", -- 19
			x"8fe00", -- 18
			x"8fc00", -- 17
			x"8fc00", -- 16
			x"8fc00", -- 15
			x"7fd00", -- 14
			x"7fd00", -- 13
			x"7fc00", -- 12
			x"8fc00", -- 11
			x"6fd00", -- 10
			x"5fd40", -- 9
			x"6fd80", -- 8
			x"4fd60", -- 7
			x"4fde0", -- 6
			x"5fcc0", -- 5
			x"4fc80", -- 4
			x"3fcf0", -- 3
			x"3fc40", -- 2
			x"2fc68", -- 1
			x"1fda4" -- 0	
	);
	

			
-------------------------------------
-------Tables for match length-------
-------------------------------------
	constant ml_state_table_aucm	: ml_state_table_t := (
					x"03e7", -- 511
					x"03e8", -- 510
					x"03e9", -- 509
					x"03ea", -- 508
					x"03eb", -- 507
					x"03ec", -- 506
					x"02bd", -- 505
					x"03ed", -- 504
					x"03ee", -- 503
					x"037a", -- 502
					x"02f4", -- 501
					x"0237", -- 500
					x"03b1", -- 499
					x"026e", -- 498
					x"03ef", -- 497
					x"03f0", -- 496
					x"03f1", -- 495
					x"03f2", -- 494
					x"03f3", -- 493
					x"03d0", -- 492
					x"0399", -- 491
					x"0362", -- 490
					x"034a", -- 489
					x"032b", -- 488
					x"0313", -- 487
					x"02dc", -- 486
					x"02c4", -- 485
					x"02a5", -- 484
					x"028d", -- 483
					x"0256", -- 482
					x"021f", -- 481
					x"0207", -- 480
					x"03f4", -- 479
					x"03f5", -- 478
					x"03f6", -- 477
					x"03b8", -- 476
					x"0381", -- 475
					x"02fb", -- 474
					x"023e", -- 473
					x"03f7", -- 472
					x"03f8", -- 471
					x"03f9", -- 470
					x"03fa", -- 469
					x"03fb", -- 468
					x"0332", -- 467
					x"02ac", -- 466
					x"0275", -- 465
					x"03fc", -- 464
					x"03d7", -- 463
					x"03a0", -- 462
					x"0388", -- 461
					x"0369", -- 460
					x"0351", -- 459
					x"031a", -- 458
					x"0302", -- 457
					x"02e3", -- 456
					x"02cb", -- 455
					x"0294", -- 454
					x"025d", -- 453
					x"0245", -- 452
					x"0226", -- 451
					x"020e", -- 450
					x"03fd", -- 449
					x"03bf", -- 448
					x"0370", -- 447
					x"0339", -- 446
					x"02b3", -- 445
					x"027c", -- 444
					x"03de", -- 443
					x"03a7", -- 442
					x"038f", -- 441
					x"0358", -- 440
					x"0321", -- 439
					x"02ea", -- 438
					x"02d2", -- 437
					x"029b", -- 436
					x"0264", -- 435
					x"022d", -- 434
					x"0215", -- 433
					x"03c6", -- 432
					x"0340", -- 431
					x"0309", -- 430
					x"0283", -- 429
					x"024c", -- 428
					x"0377", -- 427
					x"02f1", -- 426
					x"02ba", -- 425
					x"0234", -- 424
					x"03e5", -- 423
					x"03ae", -- 422
					x"035f", -- 421
					x"0328", -- 420
					x"02a2", -- 419
					x"026b", -- 418
					x"03cd", -- 417
					x"0396", -- 416
					x"0347", -- 415
					x"0310", -- 414
					x"02d9", -- 413
					x"028a", -- 412
					x"0253", -- 411
					x"021c", -- 410
					x"0204", -- 409
					x"03db", -- 408
					x"03d4", -- 407
					x"03bc", -- 406
					x"03b5", -- 405
					x"03a4", -- 404
					x"039d", -- 403
					x"0385", -- 402
					x"037e", -- 401
					x"036d", -- 400
					x"0366", -- 399
					x"0355", -- 398
					x"034e", -- 397
					x"0336", -- 396
					x"032f", -- 395
					x"031e", -- 394
					x"0317", -- 393
					x"02ff", -- 392
					x"02f8", -- 391
					x"02e7", -- 390
					x"02e0", -- 389
					x"02c8", -- 388
					x"02c1", -- 387
					x"02b0", -- 386
					x"02a9", -- 385
					x"0298", -- 384
					x"0291", -- 383
					x"0279", -- 382
					x"0272", -- 381
					x"0261", -- 380
					x"025a", -- 379
					x"0242", -- 378
					x"023b", -- 377
					x"022a", -- 376
					x"0223", -- 375
					x"020b", -- 374
					x"0212", -- 373
					x"03fe", -- 372
					x"03e2", -- 371
					x"03c3", -- 370
					x"03ab", -- 369
					x"038c", -- 368
					x"0374", -- 367
					x"033d", -- 366
					x"0325", -- 365
					x"0306", -- 364
					x"02ee", -- 363
					x"02cf", -- 362
					x"02b7", -- 361
					x"029f", -- 360
					x"0280", -- 359
					x"0268", -- 358
					x"0249", -- 357
					x"0231", -- 356
					x"03ca", -- 355
					x"0393", -- 354
					x"035c", -- 353
					x"0344", -- 352
					x"030d", -- 351
					x"02d6", -- 350
					x"0287", -- 349
					x"0250", -- 348
					x"0219", -- 347
					x"0201", -- 346
					x"03b2", -- 345
					x"037b", -- 344
					x"0363", -- 343
					x"032c", -- 342
					x"02f5", -- 341
					x"02be", -- 340
					x"02a6", -- 339
					x"026f", -- 338
					x"0238", -- 337
					x"039a", -- 336
					x"02dd", -- 335
					x"0257", -- 334
					x"0220", -- 333
					x"03d8", -- 332
					x"03d1", -- 331
					x"03b9", -- 330
					x"03a1", -- 329
					x"0389", -- 328
					x"0382", -- 327
					x"036a", -- 326
					x"0352", -- 325
					x"034b", -- 324
					x"0333", -- 323
					x"031b", -- 322
					x"0314", -- 321
					x"02fc", -- 320
					x"02e4", -- 319
					x"02cc", -- 318
					x"02c5", -- 317
					x"02ad", -- 316
					x"0295", -- 315
					x"028e", -- 314
					x"0276", -- 313
					x"025e", -- 312
					x"023f", -- 311
					x"0227", -- 310
					x"020f", -- 309
					x"0208", -- 308
					x"03df", -- 307
					x"03c0", -- 306
					x"03a8", -- 305
					x"0371", -- 304
					x"0359", -- 303
					x"033a", -- 302
					x"0322", -- 301
					x"0303", -- 300
					x"02eb", -- 299
					x"02d3", -- 298
					x"02b4", -- 297
					x"029c", -- 296
					x"027d", -- 295
					x"0265", -- 294
					x"0246", -- 293
					x"022e", -- 292
					x"0216", -- 291
					x"03c7", -- 290
					x"03af", -- 289
					x"0390", -- 288
					x"0378", -- 287
					x"0341", -- 286
					x"030a", -- 285
					x"02f2", -- 284
					x"02bb", -- 283
					x"0284", -- 282
					x"026c", -- 281
					x"024d", -- 280
					x"0235", -- 279
					x"03e6", -- 278
					x"03dc", -- 277
					x"03d5", -- 276
					x"03ce", -- 275
					x"03bd", -- 274
					x"03b6", -- 273
					x"03a5", -- 272
					x"039e", -- 271
					x"0397", -- 270
					x"038d", -- 269
					x"0386", -- 268
					x"037f", -- 267
					x"036e", -- 266
					x"0367", -- 265
					x"0360", -- 264
					x"0356", -- 263
					x"034f", -- 262
					x"0348", -- 261
					x"0337", -- 260
					x"0330", -- 259
					x"0329", -- 258
					x"031f", -- 257
					x"0318", -- 256
					x"0311", -- 255
					x"0300", -- 254
					x"02f9", -- 253
					x"02e8", -- 252
					x"02e1", -- 251
					x"02da", -- 250
					x"02d0", -- 249
					x"02c9", -- 248
					x"02c2", -- 247
					x"02b1", -- 246
					x"02aa", -- 245
					x"02a3", -- 244
					x"0299", -- 243
					x"0292", -- 242
					x"028b", -- 241
					x"027a", -- 240
					x"0273", -- 239
					x"0262", -- 238
					x"025b", -- 237
					x"0254", -- 236
					x"0243", -- 235
					x"023c", -- 234
					x"022b", -- 233
					x"0224", -- 232
					x"021d", -- 231
					x"0213", -- 230
					x"020c", -- 229
					x"0205", -- 228
					x"03e3", -- 227
					x"03e0", -- 226
					x"03d9", -- 225
					x"03d2", -- 224
					x"03cf", -- 223
					x"03cb", -- 222
					x"03c8", -- 221
					x"03c4", -- 220
					x"03c1", -- 219
					x"03ba", -- 218
					x"03b7", -- 217
					x"03b3", -- 216
					x"03b0", -- 215
					x"03ac", -- 214
					x"03a9", -- 213
					x"03a2", -- 212
					x"039b", -- 211
					x"0398", -- 210
					x"0394", -- 209
					x"0391", -- 208
					x"038a", -- 207
					x"0383", -- 206
					x"0380", -- 205
					x"037c", -- 204
					x"0379", -- 203
					x"0375", -- 202
					x"0372", -- 201
					x"036b", -- 200
					x"0364", -- 199
					x"0361", -- 198
					x"035d", -- 197
					x"035a", -- 196
					x"0353", -- 195
					x"034c", -- 194
					x"0349", -- 193
					x"0345", -- 192
					x"0342", -- 191
					x"033e", -- 190
					x"033b", -- 189
					x"0334", -- 188
					x"032d", -- 187
					x"032a", -- 186
					x"0326", -- 185
					x"0323", -- 184
					x"031c", -- 183
					x"0315", -- 182
					x"0312", -- 181
					x"030e", -- 180
					x"030b", -- 179
					x"0307", -- 178
					x"0304", -- 177
					x"02fd", -- 176
					x"02fa", -- 175
					x"02f6", -- 174
					x"02f3", -- 173
					x"02ef", -- 172
					x"02ec", -- 171
					x"02e5", -- 170
					x"02de", -- 169
					x"02db", -- 168
					x"02d7", -- 167
					x"02d4", -- 166
					x"02cd", -- 165
					x"02c6", -- 164
					x"02c3", -- 163
					x"02bf", -- 162
					x"02bc", -- 161
					x"02b8", -- 160
					x"02b5", -- 159
					x"02ae", -- 158
					x"02a7", -- 157
					x"02a4", -- 156
					x"02a0", -- 155
					x"029d", -- 154
					x"0296", -- 153
					x"028f", -- 152
					x"028c", -- 151
					x"0288", -- 150
					x"0285", -- 149
					x"0281", -- 148
					x"027e", -- 147
					x"0277", -- 146
					x"0270", -- 145
					x"026d", -- 144
					x"0269", -- 143
					x"0266", -- 142
					x"025f", -- 141
					x"0258", -- 140
					x"0255", -- 139
					x"0251", -- 138
					x"024e", -- 137
					x"024a", -- 136
					x"0247", -- 135
					x"0240", -- 134
					x"023d", -- 133
					x"0239", -- 132
					x"0236", -- 131
					x"0232", -- 130
					x"022f", -- 129
					x"0228", -- 128
					x"0221", -- 127
					x"021e", -- 126
					x"021a", -- 125
					x"0217", -- 124
					x"0210", -- 123
					x"0209", -- 122
					x"0206", -- 121
					x"0202", -- 120
					x"03e4", -- 119
					x"03dd", -- 118
					x"03d6", -- 117
					x"03cc", -- 116
					x"03c5", -- 115
					x"03be", -- 114
					x"03b4", -- 113
					x"03ad", -- 112
					x"03a6", -- 111
					x"039f", -- 110
					x"0395", -- 109
					x"038e", -- 108
					x"0387", -- 107
					x"037d", -- 106
					x"0376", -- 105
					x"036f", -- 104
					x"0368", -- 103
					x"035e", -- 102
					x"0357", -- 101
					x"0350", -- 100
					x"0346", -- 99
					x"033f", -- 98
					x"0338", -- 97
					x"0331", -- 96
					x"032e", -- 95
					x"0327", -- 94
					x"0320", -- 93
					x"0319", -- 92
					x"030f", -- 91
					x"0308", -- 90
					x"0301", -- 89
					x"02f7", -- 88
					x"02f0", -- 87
					x"02e9", -- 86
					x"02e2", -- 85
					x"02d8", -- 84
					x"02d1", -- 83
					x"02ca", -- 82
					x"02c0", -- 81
					x"02b9", -- 80
					x"02b2", -- 79
					x"02ab", -- 78
					x"02a8", -- 77
					x"02a1", -- 76
					x"029a", -- 75
					x"0293", -- 74
					x"0289", -- 73
					x"0282", -- 72
					x"027b", -- 71
					x"0274", -- 70
					x"0271", -- 69
					x"026a", -- 68
					x"0263", -- 67
					x"025c", -- 66
					x"0252", -- 65
					x"024b", -- 64
					x"0244", -- 63
					x"023a", -- 62
					x"0233", -- 61
					x"022c", -- 60
					x"0225", -- 59
					x"021b", -- 58
					x"0214", -- 57
					x"020d", -- 56
					x"0203", -- 55
					x"03e1", -- 54
					x"03da", -- 53
					x"03d3", -- 52
					x"03c2", -- 51
					x"03bb", -- 50
					x"03aa", -- 49
					x"03a3", -- 48
					x"039c", -- 47
					x"038b", -- 46
					x"0384", -- 45
					x"0373", -- 44
					x"036c", -- 43
					x"0365", -- 42
					x"035b", -- 41
					x"0354", -- 40
					x"034d", -- 39
					x"033c", -- 38
					x"0335", -- 37
					x"0324", -- 36
					x"031d", -- 35
					x"0316", -- 34
					x"0305", -- 33
					x"02fe", -- 32
					x"02ed", -- 31
					x"02e6", -- 30
					x"02df", -- 29
					x"02d5", -- 28
					x"02ce", -- 27
					x"02c7", -- 26
					x"02b6", -- 25
					x"02af", -- 24
					x"029e", -- 23
					x"0297", -- 22
					x"0290", -- 21
					x"027f", -- 20
					x"0278", -- 19
					x"0267", -- 18
					x"0260", -- 17
					x"0259", -- 16
					x"0248", -- 15
					x"0241", -- 14
					x"0230", -- 13
					x"0229", -- 12
					x"0222", -- 11
					x"0218", -- 10
					x"0211", -- 9
					x"020a", -- 8
					x"03ff", -- 7
					x"0392", -- 6
					x"030c", -- 5
					x"024f", -- 4
					x"03c9", -- 3
					x"0343", -- 2
					x"0286", -- 1
					x"0200" -- 0
	);
	
	constant ml_symbol_delta_find_state_table_aucm : ml_symbol_delta_find_state_table_t :=(
					to_unsigned(510 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 52
					to_unsigned(509 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 51
					to_unsigned(508 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 50
					to_unsigned(507 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 49
					to_unsigned(506 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 48
					to_unsigned(505 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 47
					to_unsigned(504 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 46
					to_unsigned(503 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 45
					to_unsigned(502 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 44
					to_unsigned(497 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 43
					to_unsigned(496 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 42
					to_unsigned(496 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 41
					to_unsigned(495 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 40
					to_unsigned(494 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 39
					to_unsigned(493 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 38
					to_unsigned(492 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 37
					to_unsigned(467 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 36
					to_unsigned(478 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 35
					to_unsigned(477 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 34
					to_unsigned(476 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 33
					to_unsigned(469 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 32
					to_unsigned(471 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 31
					to_unsigned(470 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 30
					to_unsigned(469 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 29
					to_unsigned(468 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 28
					to_unsigned(467 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 27
					to_unsigned(462 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 26
					to_unsigned(463 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 25
					to_unsigned(436 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 24
					to_unsigned(448 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 23
					to_unsigned(439 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 22
					to_unsigned(422 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 21
					to_unsigned(423 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 20
					to_unsigned(420 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 19
					to_unsigned(412 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 18
					to_unsigned(400 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 17
					to_unsigned(339 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 16
					to_unsigned(372 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 15
					to_unsigned(371 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 14
					to_unsigned(340 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 13
					to_unsigned(336 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 12
					to_unsigned(328 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 11
					to_unsigned(329 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 10
					to_unsigned(283 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 9
					to_unsigned(274 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 8
					to_unsigned(267 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 7
					to_unsigned(177 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 6
					to_unsigned(12 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 5
					to_unsigned(-10 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 4
					to_unsigned(-39 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 3
					to_unsigned(6 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 2
					to_unsigned(1 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1), -- 1
					to_unsigned(-4 + ML_DELTA_FIND_STATE_SHIFT, ML_STATE_TABLE_SIZE_LOG+1) -- 0
	);
		
	constant ml_symbol_delta_nb_bits_table_aucm :ml_symbol_delta_nb_bits_table_t :=(
					x"8fe00", -- 52
					x"8fe00", -- 51
					x"8fe00", -- 50
					x"8fe00", -- 49
					x"8fe00", -- 48
					x"8fe00", -- 47
					x"8fe00", -- 46
					x"8fe00", -- 45
					x"8fe00", -- 44
					x"7fd00", -- 43
					x"8fc00", -- 42
					x"8fe00", -- 41
					x"8fe00", -- 40
					x"8fe00", -- 39
					x"8fe00", -- 38
					x"8fe00", -- 37
					x"5fcc0", -- 36
					x"8fe00", -- 35
					x"8fe00", -- 34
					x"8fe00", -- 33
					x"7fc00", -- 32
					x"8fe00", -- 31
					x"8fe00", -- 30
					x"8fe00", -- 29
					x"8fe00", -- 28
					x"8fe00", -- 27
					x"7fd00", -- 26
					x"8fe00", -- 25
					x"5fc80", -- 24
					x"8fe00", -- 23
					x"6fd80", -- 22
					x"5fd40", -- 21
					x"6fd80", -- 20
					x"7fc00", -- 19
					x"6fd00", -- 18
					x"5fdc0", -- 17
					x"3fdd0", -- 16
					x"8fe00", -- 15
					x"8fe00", -- 14
					x"5fc00", -- 13
					x"5fd80", -- 12
					x"5fdc0", -- 11
					x"7fc00", -- 10
					x"4fce0", -- 9
					x"4fde0", -- 8
					x"5fd00", -- 7
					x"3fcd0", -- 6
					x"2fca0", -- 5
					x"2fdf8", -- 4
					x"3fd10", -- 3
					x"8fe00", -- 2
					x"7fd00", -- 1
					x"7fc00" -- 0
	);
-------------------------------------
-------Tables for match offset-------
-------------------------------------
constant off_state_table_aucm	: off_state_table_t := (
					x"01f4", -- 255
					x"01f5", -- 254
					x"01f6", -- 253
					x"01f7", -- 252
					x"01f8", -- 251
					x"01f9", -- 250
					x"01fa", -- 249
					x"01fb", -- 248
					x"01fc", -- 247
					x"01fd", -- 246
					x"01d1", -- 245
					x"01ba", -- 244
					x"0174", -- 243
					x"015d", -- 242
					x"012e", -- 241
					x"0117", -- 240
					x"01e8", -- 239
					x"01e7", -- 238
					x"01d0", -- 237
					x"01b9", -- 236
					x"01a2", -- 235
					x"018b", -- 234
					x"018a", -- 233
					x"0173", -- 232
					x"015c", -- 231
					x"0145", -- 230
					x"012d", -- 229
					x"0116", -- 228
					x"01e6", -- 227
					x"01cf", -- 226
					x"01b8", -- 225
					x"01a1", -- 224
					x"0189", -- 223
					x"0172", -- 222
					x"015b", -- 221
					x"0144", -- 220
					x"0143", -- 219
					x"012c", -- 218
					x"0115", -- 217
					x"01e5", -- 216
					x"01ce", -- 215
					x"01b7", -- 214
					x"01a0", -- 213
					x"019f", -- 212
					x"0188", -- 211
					x"0171", -- 210
					x"015a", -- 209
					x"0142", -- 208
					x"012b", -- 207
					x"0114", -- 206
					x"01e4", -- 205
					x"01cd", -- 204
					x"01b6", -- 203
					x"01b5", -- 202
					x"019e", -- 201
					x"0187", -- 200
					x"0170", -- 199
					x"016f", -- 198
					x"0159", -- 197
					x"0158", -- 196
					x"0141", -- 195
					x"012a", -- 194
					x"0113", -- 193
					x"0112", -- 192
					x"01e3", -- 191
					x"01cc", -- 190
					x"01cb", -- 189
					x"01b4", -- 188
					x"019d", -- 187
					x"0186", -- 186
					x"0185", -- 185
					x"016e", -- 184
					x"0157", -- 183
					x"0140", -- 182
					x"0129", -- 181
					x"0128", -- 180
					x"0111", -- 179
					x"01e2", -- 178
					x"01e1", -- 177
					x"01ca", -- 176
					x"01b3", -- 175
					x"019c", -- 174
					x"0184", -- 173
					x"016d", -- 172
					x"0156", -- 171
					x"013f", -- 170
					x"0127", -- 169
					x"0110", -- 168
					x"01e0", -- 167
					x"01c9", -- 166
					x"01b2", -- 165
					x"019b", -- 164
					x"019a", -- 163
					x"0183", -- 162
					x"016c", -- 161
					x"0155", -- 160
					x"013e", -- 159
					x"013d", -- 158
					x"0126", -- 157
					x"010f", -- 156
					x"01df", -- 155
					x"01c8", -- 154
					x"01b1", -- 153
					x"0199", -- 152
					x"0182", -- 151
					x"016b", -- 150
					x"0154", -- 149
					x"0153", -- 148
					x"013c", -- 147
					x"0125", -- 146
					x"010e", -- 145
					x"01de", -- 144
					x"01c7", -- 143
					x"01b0", -- 142
					x"01af", -- 141
					x"0198", -- 140
					x"0181", -- 139
					x"016a", -- 138
					x"0152", -- 137
					x"013b", -- 136
					x"0124", -- 135
					x"010d", -- 134
					x"010c", -- 133
					x"01f3", -- 132
					x"01f2", -- 131
					x"01dd", -- 130
					x"01dc", -- 129
					x"01db", -- 128
					x"01c6", -- 127
					x"01c5", -- 126
					x"01c4", -- 125
					x"01ae", -- 124
					x"01ad", -- 123
					x"0197", -- 122
					x"0196", -- 121
					x"0195", -- 120
					x"0180", -- 119
					x"017f", -- 118
					x"017e", -- 117
					x"0169", -- 116
					x"0168", -- 115
					x"0167", -- 114
					x"0151", -- 113
					x"0150", -- 112
					x"014f", -- 111
					x"013a", -- 110
					x"0139", -- 109
					x"0138", -- 108
					x"0123", -- 107
					x"0122", -- 106
					x"0121", -- 105
					x"010b", -- 104
					x"010a", -- 103
					x"01f1", -- 102
					x"01da", -- 101
					x"01c3", -- 100
					x"01c2", -- 99
					x"01ac", -- 98
					x"01ab", -- 97
					x"0194", -- 96
					x"017d", -- 95
					x"017c", -- 94
					x"0166", -- 93
					x"0165", -- 92
					x"014e", -- 91
					x"0137", -- 90
					x"0120", -- 89
					x"011f", -- 88
					x"0109", -- 87
					x"0108", -- 86
					x"01d9", -- 85
					x"0193", -- 84
					x"0136", -- 83
					x"01f0", -- 82
					x"014d", -- 81
					x"01fe", -- 80
					x"01ff", -- 79
					x"01ef", -- 78
					x"01ee", -- 77
					x"01d8", -- 76
					x"01d7", -- 75
					x"01c1", -- 74
					x"01c0", -- 73
					x"01aa", -- 72
					x"01a9", -- 71
					x"01a8", -- 70
					x"0192", -- 69
					x"0191", -- 68
					x"017b", -- 67
					x"017a", -- 66
					x"0164", -- 65
					x"0163", -- 64
					x"0162", -- 63
					x"014c", -- 62
					x"014b", -- 61
					x"0135", -- 60
					x"0134", -- 59
					x"011e", -- 58
					x"011d", -- 57
					x"0107", -- 56
					x"0106", -- 55
					x"0105", -- 54
					x"01ed", -- 53
					x"01ec", -- 52
					x"01eb", -- 51
					x"01ea", -- 50
					x"01e9", -- 49
					x"01d6", -- 48
					x"01d5", -- 47
					x"01d4", -- 46
					x"01d3", -- 45
					x"01d2", -- 44
					x"01bf", -- 43
					x"01be", -- 42
					x"01bd", -- 41
					x"01bc", -- 40
					x"01bb", -- 39
					x"01a7", -- 38
					x"01a6", -- 37
					x"01a5", -- 36
					x"01a4", -- 35
					x"01a3", -- 34
					x"0190", -- 33
					x"018f", -- 32
					x"018e", -- 31
					x"018d", -- 30
					x"018c", -- 29
					x"0179", -- 28
					x"0178", -- 27
					x"0177", -- 26
					x"0176", -- 25
					x"0175", -- 24
					x"0161", -- 23
					x"0160", -- 22
					x"015f", -- 21
					x"015e", -- 20
					x"014a", -- 19
					x"0149", -- 18
					x"0148", -- 17
					x"0147", -- 16
					x"0146", -- 15
					x"0133", -- 14
					x"0132", -- 13
					x"0131", -- 12
					x"0130", -- 11
					x"012f", -- 10
					x"011c", -- 9
					x"011b", -- 8
					x"011a", -- 7
					x"0119", -- 6
					x"0118", -- 5
					x"0104", -- 4
					x"0103", -- 3
					x"0102", -- 2
					x"0101", -- 1
					x"0100" -- 0
	);
	
	constant off_symbol_delta_find_state_table_aucm : off_symbol_delta_find_state_table_t :=(
					to_unsigned(0 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 31
					to_unsigned(0 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 30
					to_unsigned(0 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 29
					to_unsigned(0 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 28
					to_unsigned(254 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 27
					to_unsigned(253 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 26
					to_unsigned(252 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 25
					to_unsigned(251 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 24
					to_unsigned(250 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 23
					to_unsigned(249 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 22
					to_unsigned(248 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 21
					to_unsigned(247 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 20
					to_unsigned(246 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 19
					to_unsigned(245 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 18
					to_unsigned(234 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 17
					to_unsigned(216 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 16
					to_unsigned(206 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 15
					to_unsigned(195 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 14
					to_unsigned(178 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 13
					to_unsigned(166 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 12
					to_unsigned(157 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 11
					to_unsigned(144 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 10
					to_unsigned(134 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 9
					to_unsigned(121 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 8
					to_unsigned(73 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 7
					to_unsigned(69 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 6
					to_unsigned(80 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 5
					to_unsigned(79 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 4
					to_unsigned(79 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 3
					to_unsigned(78 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 2
					to_unsigned(29 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1), -- 1
					to_unsigned(-54 + OFF_DELTA_FIND_STATE_SHIFT, OFF_STATE_TABLE_SIZE_LOG+1) -- 0
	);
	
	constant off_symbol_delta_nb_bits_table_aucm :off_symbol_delta_nb_bits_table_t :=(
					x"00000", -- 31
					x"00000", -- 30
					x"00000", -- 29
					x"8ff00", -- 28
					x"7ff00", -- 27
					x"7ff00", -- 26
					x"7ff00", -- 25
					x"7ff00", -- 24
					x"7ff00", -- 23
					x"7ff00", -- 22
					x"7ff00", -- 21
					x"7ff00", -- 20
					x"7ff00", -- 19
					x"7ff00", -- 18
					x"5fe80", -- 17
					x"4fe80", -- 16
					x"4fea0", -- 15
					x"4fea0", -- 14
					x"4fe40", -- 13
					x"4fe60", -- 12
					x"4fea0", -- 11
					x"4fe80", -- 10
					x"4fea0", -- 9
					x"4fe80", -- 8
					x"3fe20", -- 7
					x"3fef0", -- 6
					x"6fe80", -- 5
					x"7fe00", -- 4
					x"7ff00", -- 3
					x"7ff00", -- 2
					x"3fe70", -- 1
					x"2fe50" -- 0
	);
	
end package;

package body fse_tables_pkg is
--MEM_STATIC void FSE_encodeSymbol(BIT_CStream_t* bitC, FSE_CState_t* statePtr, unsigned symbol)
--{
--    FSE_symbolCompressionTransform const symbolTT = ((const FSE_symbolCompressionTransform*)(statePtr->symbolTT))[symbol];
--    const U16* const stateTable = (const U16*)(statePtr->stateTable);
--    U32 const nbBitsOut  = (U32)((statePtr->value + symbolTT.deltaNbBits) >> 16);
--    BIT_addBits(bitC, statePtr->value, nbBitsOut);
--    statePtr->value = stateTable[ (statePtr->value >> nbBitsOut) + symbolTT.deltaFindState];
--}
--	function fse_encode_ll_bits (
--				old_state			: unsigned;
--				delta_find_state	: unsigned;
--				delta_nb_bits		: unsigned) 
--				return FSE_encode_ll2bits_return_t is
--		variable result					: FSE_encode_ll2bits_return_t;
--		variable nbits_out_full			: unsigned(LL_DELTA_NBITS_WIDTH-1 downto 0);
--		variable nbits_out				: unsigned(LL_DELTA_NBITS_WIDTH-1-16 downto 0);
--		variable state_table_index		: unsigned(LL_STATE_TABLE_SIZE_LOG-1 downto 0); 
--	begin
--		nbits_out_full			:= old_state + delta_nb_bits;
--		nbits_out				:= nbits_out_full(LL_DELTA_NBITS_WIDTH-1 downto 16);
--		state_table_index		:= resize(shift_right(old_state, to_integer(nbits_out)) + delta_find_state, LL_STATE_TABLE_SIZE_LOG);
--		result.updated_state	:= ll_state_table_aucm(to_integer(state_table_index));
--		result.nb_bits_out		:= resize(nbits_out(LL_DELTA_NBITS_WIDTH-16-1 downto 0), LL_STATE_TABLE_ELEMENT_WIDTH);
--		return result;
--	end function;
	
	function fse_encode_ll_bits (
				old_state			: unsigned;
				delta_find_state	: unsigned;
				delta_nb_bits		: unsigned) 
				return FSE_encode_ll2bits_return_t is
		variable result					: FSE_encode_ll2bits_return_t;
		variable nbits_out_full			: unsigned(31 downto 0);
		variable nbits_out				: unsigned(31 downto 0);
		variable state_table_index		: unsigned(LL_STATE_TABLE_SIZE_LOG-1 downto 0); 
	begin
		nbits_out_full			:= resize(old_state, 32) + delta_nb_bits;
		nbits_out				:= shift_right(nbits_out_full, 16);
		state_table_index		:= resize(shift_right(old_state, to_integer(nbits_out)) + delta_find_state, LL_STATE_TABLE_SIZE_LOG);
		result.updated_state	:= ll_state_table_aucm(to_integer(state_table_index));
		result.nb_bits_out		:= resize(nbits_out(LL_DELTA_NBITS_WIDTH-16-1 downto 0), LL_STATE_TABLE_ELEMENT_WIDTH);
		return result;
	end function;
	
	function fse_encode_ll_bits_init (
				delta_find_state	: unsigned;
				delta_nb_bits		: unsigned) 
				return FSE_encode_ll2bits_return_t is
		variable result					: FSE_encode_ll2bits_return_t;
		variable nbits_out_full			: unsigned(31 downto 0);
		variable nbits_out				: unsigned(31 downto 0);
		variable state_table_index		: unsigned(LL_STATE_TABLE_SIZE_LOG-1 downto 0);
		variable updated_state_temp		: unsigned(31 downto 0);
	begin
		nbits_out_full			:= to_unsigned(2**15,32) + delta_nb_bits;
		nbits_out				:= shift_right(nbits_out_full, 16);
		updated_state_temp		:= shift_left(nbits_out,16) - delta_nb_bits;
		state_table_index		:= resize(shift_right(updated_state_temp, to_integer(nbits_out)) + delta_find_state, LL_STATE_TABLE_SIZE_LOG);
		result.updated_state	:= ll_state_table_aucm(to_integer(state_table_index));
		--result.nb_bits_out		:= resize(nbits_out(LL_DELTA_NBITS_WIDTH-16-1 downto 0), LL_STATE_TABLE_ELEMENT_WIDTH);
		result.nb_bits_out		:= (others => '0');
		return result;
	end function;
	
--		function fse_encode_ll_bits_init (
--				delta_find_state	: unsigned;
--				delta_nb_bits		: unsigned) 
--				return FSE_encode_ll2bits_return_t is
--		variable result					: FSE_encode_ll2bits_return_t;
--		variable nbits_out_full			: unsigned(delta_nb_bits'length + 1 downto 0);
--		variable nbits_out				: unsigned(delta_nb_bits'length-16 downto 0);
--		variable state_table_index		: unsigned(LL_STATE_TABLE_SIZE_LOG-1 downto 0);
--		variable updated_state_temp		: unsigned(LL_DELTA_NBITS_WIDTH-1 downto 0);
--	begin
--		nbits_out_full			:= to_unsigned(2**15,delta_nb_bits'length + 2) + delta_nb_bits;
--		nbits_out				:= nbits_out_full(delta_nb_bits'length downto 16);
--		updated_state_temp		:= shift_left(nbits_out,16) - delta_nb_bits;
--		state_table_index		:= resize(shift_right(updated_state_temp, to_integer(nbits_out)) + delta_find_state, LL_STATE_TABLE_SIZE_LOG);
--		result.updated_state	:= ll_state_table_aucm(to_integer(state_table_index));
		--result.nb_bits_out		:= resize(nbits_out(LL_DELTA_NBITS_WIDTH-16-1 downto 0), LL_STATE_TABLE_ELEMENT_WIDTH);
--		result.nb_bits_out		:= (others => '0');
--		return result;
--	end function;
	
	
--	function fse_encode_ml_bits (
--				old_state			: unsigned;
--				delta_find_state	: unsigned;
--				delta_nb_bits		: unsigned) 
--				return FSE_encode_ml2bits_return_t is
--		variable result					: FSE_encode_ml2bits_return_t;
--		variable nbits_out_full			: unsigned(ML_DELTA_NBITS_WIDTH-1 downto 0);
--		variable nbits_out				: unsigned(ML_DELTA_NBITS_WIDTH-1-16 downto 0);
--		variable state_table_index		: unsigned(ML_STATE_TABLE_SIZE_LOG-1 downto 0); 
--	begin
--		nbits_out_full			:= old_state + delta_nb_bits;
--		nbits_out				:= nbits_out_full(ML_DELTA_NBITS_WIDTH-1 downto 16);
--		state_table_index		:= resize(shift_right(old_state, to_integer(nbits_out)) + delta_find_state, ML_STATE_TABLE_SIZE_LOG);
--		result.updated_state	:= ml_state_table_aucm(to_integer(state_table_index));
--		result.nb_bits_out		:= resize(nbits_out(ML_DELTA_NBITS_WIDTH-16-1 downto 0), ML_STATE_TABLE_ELEMENT_WIDTH);
--		return result;
--	end function;
	
	function fse_encode_ml_bits (
				old_state			: unsigned;
				delta_find_state	: unsigned;
				delta_nb_bits		: unsigned) 
				return FSE_encode_ml2bits_return_t is
		variable result					: FSE_encode_ml2bits_return_t;
		variable nbits_out_full			: unsigned(31 downto 0);
		variable nbits_out				: unsigned(31 downto 0);
		variable state_table_index		: unsigned(ML_STATE_TABLE_SIZE_LOG-1 downto 0); 
	begin
		nbits_out_full			:= resize(old_state, 32) + delta_nb_bits;
		nbits_out				:= shift_right(nbits_out_full, 16);
		state_table_index		:= resize(shift_right(old_state, to_integer(nbits_out)) + delta_find_state, ML_STATE_TABLE_SIZE_LOG);
		result.updated_state	:= ml_state_table_aucm(to_integer(state_table_index));
		result.nb_bits_out		:= resize(nbits_out(ML_DELTA_NBITS_WIDTH-16-1 downto 0), ML_STATE_TABLE_ELEMENT_WIDTH);
		return result;
	end function;
	
--	function fse_encode_ml_bits_init (
--				delta_find_state	: unsigned;
--				delta_nb_bits		: unsigned) 
--				return FSE_encode_ml2bits_return_t is
--		variable result					: FSE_encode_ml2bits_return_t;
--		variable nbits_out_full			: unsigned(ML_DELTA_NBITS_WIDTH-1 downto 0);
--		variable nbits_out				: unsigned(ML_DELTA_NBITS_WIDTH-1-16 downto 0);
--		variable state_table_index		: unsigned(ML_STATE_TABLE_SIZE_LOG-1 downto 0);
--		variable updated_state_temp		: unsigned(ML_DELTA_NBITS_WIDTH-1 downto 0);
--	begin
--		nbits_out_full			:= to_unsigned(2**15,ML_DELTA_NBITS_WIDTH) + delta_nb_bits;
--		nbits_out				:= nbits_out_full(ML_DELTA_NBITS_WIDTH-1 downto 16);
--		updated_state_temp		:= resize((shift_left(nbits_out,16) - delta_nb_bits),ML_DELTA_NBITS_WIDTH);
--		state_table_index		:= resize(shift_right(updated_state_temp, to_integer(nbits_out)) + delta_find_state, ML_STATE_TABLE_SIZE_LOG);
--		result.updated_state	:= ml_state_table_aucm(to_integer(state_table_index));
		--result.nb_bits_out		:= resize(nbits_out(ML_DELTA_NBITS_WIDTH-16-1 downto 0), ML_STATE_TABLE_ELEMENT_WIDTH);
--		result.nb_bits_out		:= (others => '0');
--		return result;
--	end function;
	
	function fse_encode_ml_bits_init (
				delta_find_state	: unsigned;
				delta_nb_bits		: unsigned) 
				return FSE_encode_ml2bits_return_t is
		variable result					: FSE_encode_ml2bits_return_t;
		variable nbits_out_full			: unsigned(31 downto 0);
		variable nbits_out				: unsigned(31 downto 0);
		variable state_table_index		: unsigned(ML_STATE_TABLE_SIZE_LOG-1 downto 0);
		variable updated_state_temp		: unsigned(31 downto 0);
	begin
		nbits_out_full			:= to_unsigned(2**15,32) + delta_nb_bits;
		nbits_out				:= shift_right(nbits_out_full, 16);
		updated_state_temp		:= shift_left(nbits_out,16) - delta_nb_bits;
		state_table_index		:= resize(shift_right(updated_state_temp, to_integer(nbits_out)) + delta_find_state, ML_STATE_TABLE_SIZE_LOG);
		result.updated_state	:= ml_state_table_aucm(to_integer(state_table_index));
		--result.nb_bits_out		:= resize(nbits_out(ML_DELTA_NBITS_WIDTH-16-1 downto 0), ML_STATE_TABLE_ELEMENT_WIDTH);
		result.nb_bits_out		:= (others => '0');
		return result;
	end function;
	
--	function fse_encode_off_bits (
--				old_state			: unsigned;
--				delta_find_state	: unsigned;
--				delta_nb_bits		: unsigned) 
--				return FSE_encode_off2bits_return_t is
--		variable result					: FSE_encode_off2bits_return_t;
--		variable nbits_out_full			: unsigned(OFF_DELTA_NBITS_WIDTH-1 downto 0);
--		variable nbits_out				: unsigned(OFF_DELTA_NBITS_WIDTH-1-16 downto 0);
--		variable state_table_index		: unsigned(OFF_STATE_TABLE_SIZE_LOG-1 downto 0); 
--	begin
---		nbits_out_full			:= old_state + delta_nb_bits;
	--	nbits_out				:= nbits_out_full(OFF_DELTA_NBITS_WIDTH-1 downto 16);
--		state_table_index		:= resize(shift_right(old_state, to_integer(nbits_out)) + delta_find_state, OFF_STATE_TABLE_SIZE_LOG);
--		result.updated_state	:= off_state_table_aucm(to_integer(state_table_index));
--		result.nb_bits_out		:= resize(nbits_out(OFF_DELTA_NBITS_WIDTH-16-1 downto 0), OFF_STATE_TABLE_ELEMENT_WIDTH);
--		return result;
--	end function;
	
	function fse_encode_off_bits (
				old_state			: unsigned;
				delta_find_state	: unsigned;
				delta_nb_bits		: unsigned) 
				return FSE_encode_off2bits_return_t is
		variable result					: FSE_encode_off2bits_return_t;
		variable nbits_out_full			: unsigned(31 downto 0);
		variable nbits_out				: unsigned(31 downto 0);
		variable state_table_index		: unsigned(OFF_STATE_TABLE_SIZE_LOG-1 downto 0); 
	begin
		nbits_out_full			:= resize(old_state, 32) + delta_nb_bits;
		nbits_out				:= shift_right(nbits_out_full, 16);
		state_table_index		:= resize(shift_right(old_state, to_integer(nbits_out)) + delta_find_state, OFF_STATE_TABLE_SIZE_LOG);
		result.updated_state	:= off_state_table_aucm(to_integer(state_table_index));
		result.nb_bits_out		:= resize(nbits_out(OFF_DELTA_NBITS_WIDTH-16-1 downto 0), OFF_STATE_TABLE_ELEMENT_WIDTH);
		return result;
	end function;
	
--	function fse_encode_off_bits_init (
--				delta_find_state	: unsigned;
--				delta_nb_bits		: unsigned) 
--				return FSE_encode_off2bits_return_t is
--		variable result					: FSE_encode_off2bits_return_t;
--		variable nbits_out_full			: unsigned(OFF_DELTA_NBITS_WIDTH-1 downto 0);
--		variable nbits_out				: unsigned(OFF_DELTA_NBITS_WIDTH-1-16 downto 0);
--		variable state_table_index		: unsigned(OFF_STATE_TABLE_SIZE_LOG-1 downto 0);
--		variable updated_state_temp		: unsigned(OFF_DELTA_NBITS_WIDTH-1 downto 0);
--	begin
--		nbits_out_full			:= to_unsigned(2**15,OFF_DELTA_NBITS_WIDTH) + delta_nb_bits;
--		nbits_out				:= nbits_out_full(OFF_DELTA_NBITS_WIDTH-1 downto 16);
--		updated_state_temp		:= resize((shift_left(nbits_out,16) - delta_nb_bits), OFF_DELTA_NBITS_WIDTH);
--		state_table_index		:= resize(shift_right(updated_state_temp, to_integer(nbits_out)) + delta_find_state, OFF_STATE_TABLE_SIZE_LOG);
--		result.updated_state	:= off_state_table_aucm(to_integer(state_table_index));
--		--result.nb_bits_out		:= resize(nbits_out(OFF_DELTA_NBITS_WIDTH-16-1 downto 0), OFF_STATE_TABLE_ELEMENT_WIDTH);
--		result.nb_bits_out		:= (others => '0');
--		return result;
--	end function;
	
	function fse_encode_off_bits_init (
				delta_find_state	: unsigned;
				delta_nb_bits		: unsigned) 
				return FSE_encode_off2bits_return_t is
		variable result					: FSE_encode_off2bits_return_t;
		variable nbits_out_full			: unsigned(31 downto 0);
		variable nbits_out				: unsigned(31 downto 0);
		variable state_table_index		: unsigned(OFF_STATE_TABLE_SIZE_LOG-1 downto 0);
		variable updated_state_temp		: unsigned(31 downto 0);
	begin
		nbits_out_full			:= to_unsigned(2**15,32) + delta_nb_bits;
		nbits_out				:= shift_right(nbits_out_full, 16);
		updated_state_temp		:= shift_left(nbits_out,16) - delta_nb_bits;
		state_table_index		:= resize(shift_right(updated_state_temp, to_integer(nbits_out)) + delta_find_state, OFF_STATE_TABLE_SIZE_LOG);
		result.updated_state	:= off_state_table_aucm(to_integer(state_table_index));
		--result.nb_bits_out		:= resize(nbits_out(OFF_DELTA_NBITS_WIDTH-16-1 downto 0), OFF_STATE_TABLE_ELEMENT_WIDTH);
		result.nb_bits_out		:= (others => '0');
		return result;
	end function;
	
	
end package body fse_tables_pkg;