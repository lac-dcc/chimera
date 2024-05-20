// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

module	sin_table
(
	input					clk,
	input					rst_n,
	
	input				[9:0]	angle,
	
	output	reg	signed	[9:0]	sin_value

);



always@(*)
begin
	case(angle)
		0	:	 sin_value	=	0		;	
		1	:	 sin_value	=	4		;	
		2	:	 sin_value	=	8		;	
		3	:	 sin_value	=	13		;
		4	:	 sin_value	=	17		;
		5	:	 sin_value	=	22		;
		6	:	 sin_value	=	26		;
		7	:	 sin_value	=	31		;
		8	:	 sin_value	=	35		;
		9	:	 sin_value	=	40		;
		10	:	 sin_value	=	44		;
		11	:	 sin_value	=	48		;
		12	:	 sin_value	=	53		;
		13	:	 sin_value	=	57		;
		14	:	 sin_value	=	61		;
		15	:	 sin_value	=	66		;
		16	:	 sin_value	=	70		;
		17	:	 sin_value	=	74		;
		18	:	 sin_value	=	79		;
		19	:	 sin_value	=	83		;
		20	:	 sin_value	=	87		;
		21	:	 sin_value	=	91		;
		22	:	 sin_value	=	95		;
		23	:	 sin_value	=	100		;
		24	:	 sin_value	=	104		;
		25	:	 sin_value	=	108		;
		26	:	 sin_value	=	112		;
		27	:	 sin_value	=	116		;
		28	:	 sin_value	=	120		;
		29	:	 sin_value	=	124		;
		30	:	 sin_value	=	127		;
		31	:	 sin_value	=	131		;
		32	:	 sin_value	=	135		;
		33	:	 sin_value	=	139		;
		34	:	 sin_value	=	143		;
		35	:	 sin_value	=	146		;
		36	:	 sin_value	=	150		;
		37	:	 sin_value	=	154		;
		38	:	 sin_value	=	157		;
		39	:	 sin_value	=	161		;
		40	:	 sin_value	=	164		;
		41	:	 sin_value	=	167		;
		42	:	 sin_value	=	171		;
		43	:	 sin_value	=	174		;
		44	:	 sin_value	=	177		;
		45	:	 sin_value	=	181		;
		46	:	 sin_value	=	184		;
		47	:	 sin_value	=	187		;
		48	:	 sin_value	=	190		;
		49	:	 sin_value	=	193		;
		50	:	 sin_value	=	196		;
		51	:	 sin_value	=	198		;
		52	:	 sin_value	=	201		;
		53	:	 sin_value	=	204		;
		54	:	 sin_value	=	207		;
		55	:	 sin_value	=	209		;
		56	:	 sin_value	=	212		;
		57	:	 sin_value	=	214		;
		58	:	 sin_value	=	217		;
		59	:	 sin_value	=	219		;
		60	:	 sin_value	=	221		;
		61	:	 sin_value	=	223		;
		62	:	 sin_value	=	226		;
		63	:	 sin_value	=	228		;
		64	:	 sin_value	=	230		;
		65	:	 sin_value	=	232		;
		66	:	 sin_value	=	233		;
		67	:	 sin_value	=	235		;
		68	:	 sin_value	=	237		;
		69	:	 sin_value	=	238		;
		70	:	 sin_value	=	240		;
		71	:	 sin_value	=	242		;
		72	:	 sin_value	=	243		;
		73	:	 sin_value	=	244		;
		74	:	 sin_value	=	246		;
		75	:	 sin_value	=	247		;
		76	:	 sin_value	=	248		;
		77	:	 sin_value	=	249		;
		78	:	 sin_value	=	250		;
		79	:	 sin_value	=	251		;
		80	:	 sin_value	=	252		;
		81	:	 sin_value	=	252		;
		82	:	 sin_value	=	253		;
		83	:	 sin_value	=	254		;
		84	:	 sin_value	=	254		;
		85	:	 sin_value	=	255		;
		86	:	 sin_value	=	255		;
		87	:	 sin_value	=	255		;
		88	:	 sin_value	=	255		;
		89	:	 sin_value	=	255		;
		90	:	 sin_value	=	256		;
		91	:	 sin_value	=	255		;
		92	:	 sin_value	=	255		;
		93	:	 sin_value	=	255		;
		94	:	 sin_value	=	255		;
		95	:	 sin_value	=	255		;
		96	:	 sin_value	=	254		;
		97	:	 sin_value	=	254		;
		98	:	 sin_value	=	253		;
		99	:	 sin_value	=	252		;
		100	:	 sin_value	=	252		;
		101	:	 sin_value	=	251		;
		102	:	 sin_value	=	250		;
		103	:	 sin_value	=	249		;
		104	:	 sin_value	=	248		;
		105	:	 sin_value	=	247		;
		106	:	 sin_value	=	246		;
		107	:	 sin_value	=	244		;
		108	:	 sin_value	=	243		;
		109	:	 sin_value	=	242		;
		110	:	 sin_value	=	240		;
		111	:	 sin_value	=	238		;
		112	:	 sin_value	=	237		;
		113	:	 sin_value	=	235		;
		114	:	 sin_value	=	233		;
		115	:	 sin_value	=	232		;
		116	:	 sin_value	=	230		;
		117	:	 sin_value	=	228		;
		118	:	 sin_value	=	226		;
		119	:	 sin_value	=	223		;
		120	:	 sin_value	=	221		;
		121	:	 sin_value	=	219		;
		122	:	 sin_value	=	217		;
		123	:	 sin_value	=	214		;
		124	:	 sin_value	=	212		;
		125	:	 sin_value	=	209		;
		126	:	 sin_value	=	207		;
		127	:	 sin_value	=	204		;
		128	:	 sin_value	=	201		;
		129	:	 sin_value	=	198		;
		130	:	 sin_value	=	196		;
		131	:	 sin_value	=	193		;
		132	:	 sin_value	=	190		;
		133	:	 sin_value	=	187		;
		134	:	 sin_value	=	184		;
		135	:	 sin_value	=	181		;
		136	:	 sin_value	=	177		;
		137	:	 sin_value	=	174		;
		138	:	 sin_value	=	171		;
		139	:	 sin_value	=	167		;
		140	:	 sin_value	=	164		;
		141	:	 sin_value	=	161		;
		142	:	 sin_value	=	157		;
		143	:	 sin_value	=	154		;
		144	:	 sin_value	=	150		;
		145	:	 sin_value	=	146		;
		146	:	 sin_value	=	143		;
		147	:	 sin_value	=	139		;
		148	:	 sin_value	=	135		;
		149	:	 sin_value	=	131		;
		150	:	 sin_value	=	127		;
		151	:	 sin_value	=	124		;
		152	:	 sin_value	=	120		;
		153	:	 sin_value	=	116		;
		154	:	 sin_value	=	112		;
		155	:	 sin_value	=	108		;
		156	:	 sin_value	=	104		;
		157	:	 sin_value	=	100		;
		158	:	 sin_value	=	95		;
		159	:	 sin_value	=	91		;
		160	:	 sin_value	=	87		;
		161	:	 sin_value	=	83		;
		162	:	 sin_value	=	79		;
		163	:	 sin_value	=	74		;
		164	:	 sin_value	=	70		;
		165	:	 sin_value	=	66		;
		166	:	 sin_value	=	61		;
		167	:	 sin_value	=	57		;
		168	:	 sin_value	=	53		;
		169	:	 sin_value	=	48		;
		170	:	 sin_value	=	44		;
		171	:	 sin_value	=	40		;
		172	:	 sin_value	=	35		;
		173	:	 sin_value	=	31		;
		174	:	 sin_value	=	26		;
		175	:	 sin_value	=	22		;
		176	:	 sin_value	=	17		;
		177	:	 sin_value	=	13		;	
		178	:	 sin_value	=	8		;	
		179	:	 sin_value	=	4		;	
		180	:	 sin_value	=	0		;	
		181	:	 sin_value	=	-4		;	
		182	:	 sin_value	=	-8		;	
		183	:	 sin_value	=	-1		;
		184	:	 sin_value	=	-17		;
		185	:	 sin_value	=	-22		;
		186	:	 sin_value	=	-26		;
		187	:	 sin_value	=	-31		;
		188	:	 sin_value	=	-35		;
		189	:	 sin_value	=	-40		;
		190	:	 sin_value	=	-44		;
		191	:	 sin_value	=	-48		;
		192	:	 sin_value	=	-53		;
		193	:	 sin_value	=	-57		;
		194	:	 sin_value	=	-61		;
		195	:	 sin_value	=	-66		;
		196	:	 sin_value	=	-70		;
		197	:	 sin_value	=	-74		;
		198	:	 sin_value	=	-79		;
		199	:	 sin_value	=	-83		;
		200	:	 sin_value	=	-87		;
		201	:	 sin_value	=	-91		;
		202	:	 sin_value	=	-95		;
		203	:	 sin_value	=	-100	;
		204	:	 sin_value	=	-104	;
		205	:	 sin_value	=	-108	;
		206	:	 sin_value	=	-112	;
		207	:	 sin_value	=	-116	;
		208	:	 sin_value	=	-120	;
		209	:	 sin_value	=	-124	;
		210	:	 sin_value	=	-127	;
		211	:	 sin_value	=	-131	;
		212	:	 sin_value	=	-135	;
		213	:	 sin_value	=	-139	;
		214	:	 sin_value	=	-143	;
		215	:	 sin_value	=	-146	;
		216	:	 sin_value	=	-150	;
		217	:	 sin_value	=	-154	;
		218	:	 sin_value	=	-157	;
		219	:	 sin_value	=	-161	;
		220	:	 sin_value	=	-164	;
		221	:	 sin_value	=	-167	;
		222	:	 sin_value	=	-171	;
		223	:	 sin_value	=	-174	;
		224	:	 sin_value	=	-177	;
		225	:	 sin_value	=	-181	;
		226	:	 sin_value	=	-184	;
		227	:	 sin_value	=	-187	;
		228	:	 sin_value	=	-190	;
		229	:	 sin_value	=	-193	;
		230	:	 sin_value	=	-196	;
		231	:	 sin_value	=	-198	;
		232	:	 sin_value	=	-201	;
		233	:	 sin_value	=	-204	;
		234	:	 sin_value	=	-207	;
		235	:	 sin_value	=	-209	;
		236	:	 sin_value	=	-212	;
		237	:	 sin_value	=	-214	;
		238	:	 sin_value	=	-217	;
		239	:	 sin_value	=	-219	;
		240	:	 sin_value	=	-221	;
		241	:	 sin_value	=	-223	;
		242	:	 sin_value	=	-226	;
		243	:	 sin_value	=	-228	;
		244	:	 sin_value	=	-230	;
		245	:	 sin_value	=	-232	;
		246	:	 sin_value	=	-233	;
		247	:	 sin_value	=	-235	;
		248	:	 sin_value	=	-237	;
		249	:	 sin_value	=	-238	;
		250	:	 sin_value	=	-240	;
		251	:	 sin_value	=	-242	;
		252	:	 sin_value	=	-243	;
		253	:	 sin_value	=	-244	;
		254	:	 sin_value	=	-246	;
		255	:	 sin_value	=	-247	;
		256	:	 sin_value	=	-248	;
		257	:	 sin_value	=	-249	;
		258	:	 sin_value	=	-250	;
		259	:	 sin_value	=	-251	;
		260	:	 sin_value	=	-252	;
		261	:	 sin_value	=	-252	;
		262	:	 sin_value	=	-253	;
		263	:	 sin_value	=	-254	;
		264	:	 sin_value	=	-254	;
		265	:	 sin_value	=	-255	;
		266	:	 sin_value	=	-255	;
		267	:	 sin_value	=	-255	;
		268	:	 sin_value	=	-255	;
		269	:	 sin_value	=	-255	;
		270	:	 sin_value	=	-256	;
		271	:	 sin_value	=	-255	;
		272	:	 sin_value	=	-255	;
		273	:	 sin_value	=	-255	;
		274	:	 sin_value	=	-255	;
		275	:	 sin_value	=	-255	;
		276	:	 sin_value	=	-254	;
		277	:	 sin_value	=	-254	;
		278	:	 sin_value	=	-253	;
		279	:	 sin_value	=	-252	;
		280	:	 sin_value	=	-252	;
		281	:	 sin_value	=	-251	;
		282	:	 sin_value	=	-250	;
		283	:	 sin_value	=	-249	;
		284	:	 sin_value	=	-248	;
		285	:	 sin_value	=	-247	;
		286	:	 sin_value	=	-246	;
		287	:	 sin_value	=	-244	;
		288	:	 sin_value	=	-243	;
		289	:	 sin_value	=	-242	;
		290	:	 sin_value	=	-240	;
		291	:	 sin_value	=	-238	;
		292	:	 sin_value	=	-237	;
		293	:	 sin_value	=	-235	;
		294	:	 sin_value	=	-233	;
		295	:	 sin_value	=	-232	;
		296	:	 sin_value	=	-230	;
		297	:	 sin_value	=	-228	;
		298	:	 sin_value	=	-226	;
		299	:	 sin_value	=	-223	;
		300	:	 sin_value	=	-221	;
		301	:	 sin_value	=	-219	;
		302	:	 sin_value	=	-217	;
		303	:	 sin_value	=	-214	;
		304	:	 sin_value	=	-212	;
		305	:	 sin_value	=	-209	;
		306	:	 sin_value	=	-207	;
		307	:	 sin_value	=	-204	;
		308	:	 sin_value	=	-201	;
		309	:	 sin_value	=	-198	;
		310	:	 sin_value	=	-196	;
		311	:	 sin_value	=	-193	;
		312	:	 sin_value	=	-190	;
		313	:	 sin_value	=	-187	;
		314	:	 sin_value	=	-184	;
		315	:	 sin_value	=	-181	;
		316	:	 sin_value	=	-177	;
		317	:	 sin_value	=	-174	;
		318	:	 sin_value	=	-171	;
		319	:	 sin_value	=	-167	;
		320	:	 sin_value	=	-164	;
		321	:	 sin_value	=	-161	;
		322	:	 sin_value	=	-157	;
		323	:	 sin_value	=	-154	;
		324	:	 sin_value	=	-150	;
		325	:	 sin_value	=	-146	;
		326	:	 sin_value	=	-143	;
		327	:	 sin_value	=	-139	;
		328	:	 sin_value	=	-135	;
		329	:	 sin_value	=	-131	;
		330	:	 sin_value	=	-128	;
		331	:	 sin_value	=	-124	;
		332	:	 sin_value	=	-120	;
		333	:	 sin_value	=	-116	;
		334	:	 sin_value	=	-112	;
		335	:	 sin_value	=	-108	;
		336	:	 sin_value	=	-104	;
		337	:	 sin_value	=	-100	;
		338	:	 sin_value	=	-95		;
		339	:	 sin_value	=	-91		;
		340	:	 sin_value	=	-87		;
		341	:	 sin_value	=	-83		;
		342	:	 sin_value	=	-79		;
		343	:	 sin_value	=	-74		;
		344	:	 sin_value	=	-70		;
		345	:	 sin_value	=	-66		;
		346	:	 sin_value	=	-61		;
		347	:	 sin_value	=	-57		;
		348	:	 sin_value	=	-53		;
		349	:	 sin_value	=	-48		;
		350	:	 sin_value	=	-44		;
		351	:	 sin_value	=	-40		;
		352	:	 sin_value	=	-35		;
		353	:	 sin_value	=	-31		;
		354	:	 sin_value	=	-26		;
		355	:	 sin_value	=	-22		;
		356	:	 sin_value	=	-17		;
		357	:	 sin_value	=	-13		;
		358	:	 sin_value	=	-8		;
		359	:	 sin_value	=	-4		;
		default	:sin_value	=	0	;	
	endcase      
end              
                 
endmodule	     
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 