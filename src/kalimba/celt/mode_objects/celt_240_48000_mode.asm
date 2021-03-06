// *****************************************************************************
// Copyright (c) 2017 Qualcomm Technologies International, Ltd.        
// All Rights Reserved. 
// Notifications and licenses (if any) are retained for attribution purposes only.     
// Part of ADK_CSR867x.WIN 4.3
//
// *****************************************************************************

#ifndef CELT_MODE_240_48000_INCLUDED
#define CELT_MODE_240_48000_INCLUDED

#include "../celt_library.h"
// *****************************************************************************
// MODULE:
//    $celt.celt_240_48000_mode 
//
// DESCRIPTION:
//    Mode object for N=240 and fs = 48000Hz
//
// *****************************************************************************
.MODULE $M.celt.mode.celt_240_48000_mode;
.DATASEGMENT DM;
   // -- Definition of mode object
   .VAR $celt.mode.celt_240_48000_mode[$celt.mode.STRUC_SIZE] = 
      48000,             // Fs
      120,               // overlap
      240,               // mdctSize
      19,                // nbEBands
      20,                // pitchEnd
      0.8,               // ePredCoef
      12,                // nbAllocVectors
      2,                 // nbShortMdcts
      120,               // shortMdctSize
      &eBands,           // eBands_addr
      &allocVectors,     // allocVectors_addr
      &window,           // window_addr
      &prob,             // prob_addr
      &bits,             // bits_addr
      &ebands_dif_sqrt,  // ebands_dif_sqrt_addr
      &trig,             // trig_addr;
      0,
      0,
      0,
      0;            

  
   // -- start frequency bin of eBANDs 
   .VAR eBands[19+2] =  0,  3,  6,  9,  12,  15,  18,  21,  24,  27,  32,  37,  44,  53,  64,  77,  95,  120,  155,  200,  240;
   
   // -- Allocation vectors
   .VAR allocVectors[228] = 			
      4,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0, 
      5,     4,     2,     2,     1,     1,     1,     1,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0, 
      6,     4,     4,     3,     3,     3,     4,     5,     5,     7,     6,     5,     4,     0,     0,     0,     0,     0,     0, 
      6,     7,     6,     5,     4,     4,     5,     5,     6,     8,     7,     6,     5,     4,     0,     0,     0,     0,     0, 
      7,     8,     8,     7,     5,     5,     6,     6,     7,     9,     8,     7,     6,     5,     5,     5,     0,     0,     0, 
      8,     11,    12,    10,    8,     8,     7,     8,     7,     10,    9,     8,     6,     5,     5,     5,     5,     1,     0, 
      9,     14,    14,    12,    11,    10,    9,     8,     8,     10,    9,     8,     8,     8,     10,    9,     9,     1,     0, 
      14,    17,    14,    13,    12,    11,    10,    10,    9,     11,    9,     16,    11,    14,    14,    19,    17,    9,     1, 
      19,    20,    16,    15,    15,    14,    14,    15,    13,    22,    19,    25,    27,    37,    35,    36,    38,    33,    1, 
      20,    21,    19,    18,    19,    21,    20,    21,    21,    33,    27,    33,    36,    36,    39,    47,    55,    51,    29, 
      23,    21,    21,    26,    29,    29,    28,    26,    26,    43,    39,    47,    52,    56,    58,    58,    68,    77,    58, 
      25,    30,    32,    41,    43,    41,    40,    40,    41,    64,    56,    66,    80,    84,    86,    86,    86,    96,    86;
      
   // -- Window
   .VAR/DM2 window[120] =			
      0.000067286964622, 0.000605513458140, 0.001681596972048, 0.003294796217233, 0.005443994421512, 0.008127692155540, 0.011344001628459, 0.015090632252395, 
      0.019364885985851, 0.024163635447621, 0.029483314603567, 0.035319905728102, 0.041668910533190, 0.048525348305702, 0.055883716791868, 0.063737995922565, 
      0.072081618010998, 0.080907426774502, 0.090207703411579, 0.099974110722542, 0.110197685658932, 0.120868831872940, 0.131977289915085, 0.143512144684792, 
      0.155461773276329, 0.167813882231712, 0.180555492639542, 0.193672895431519, 0.207151710987091, 0.220976814627647, 0.235132426023483, 0.249602079391479, 
      0.264368593692780, 0.279414176940918, 0.294720411300659, 0.310268193483353, 0.326037883758545, 0.342009305953979, 0.358161777257919, 0.374474078416824, 
      0.390924632549286, 0.407491415739059, 0.424152135848999, 0.440884232521057, 0.457664847373962, 0.474471032619476, 0.491279780864716, 0.508067965507507, 
      0.524812638759613, 0.541490793228149, 0.558079719543457, 0.574557006359100, 0.590900480747223, 0.607088387012482, 0.623099505901337, 0.638913035392761, 
      0.654508948326111, 0.669867753982544, 0.684970796108246, 0.699800074100494, 0.714338719844818, 0.728570520877838, 0.742480456829071, 0.756054222583771, 
      0.769278943538666, 0.782142579555511, 0.794634282588959, 0.806744456291199, 0.818464577198029, 0.829787313938141, 0.840706706047058, 0.851217806339264, 
      0.861316978931427, 0.871001839637756, 0.880271136760712, 0.889124810695648, 0.897563993930817, 0.905590951442719, 0.913209021091461, 0.920422673225403, 
      0.927237391471863, 0.933659553527832, 0.939696550369263, 0.945356726646423, 0.950649082660675, 0.955583512783051, 0.960170686244965, 0.964421689510345, 
      0.968348503112793, 0.971963346004486, 0.975279033184052, 0.978308856487274, 0.981066167354584, 0.983564794063568, 0.985818684101105, 0.987841904163361, 
      0.989648580551147, 0.991252720355988, 0.992668509483337, 0.993909716606140, 0.994990050792694, 0.995922982692719, 0.996721625328064, 0.997398734092712, 
      0.997966647148132, 0.998437285423279, 0.998821973800659, 0.999131500720978, 0.999376058578491, 0.999565243721008, 0.999707996845245, 0.999812483787537, 
      0.999886155128479, 0.999935626983643, 0.999966979026794, 0.999985158443451, 0.999994575977325, 0.999998569488525, 0.999999821186066, 1.000000000000000;
 
   // -- Prob vector     
   .VAR prob[76] =			
          6000,    15200,     5800,    15632, 
          5600,    16072,     5400,    16522, 
          5200,    16978,     5000,    17444, 
          4800,    17918,     4600,    18400, 
          4400,    18892,     4200,    19394, 
          4000,    19906,     3800,    20428, 
          3600,    20962,     3400,    21504, 
          3200,    22058,     3000,    22624, 
          2800,    23202,     2600,    23792, 
          2400,    24394,     9000,     9530, 
          8760,     9934,     8520,    10346, 
          8280,    10766,     8040,    11194, 
          7800,    11630,     7560,    12074, 
          7320,    12528,     7080,    12992, 
          6840,    13466,     6600,    13948, 
          6360,    14440,     6120,    14944, 
          5880,    15458,     5640,    15984, 
          5400,    16522,     5160,    17070, 
          4920,    17632,     4680,    18206;
      
   // -- bits verctors      
   .BLOCK/DM bits;
      .VAR bits_vector_offset[19] =  19,  19,  19,  19,  19,  19,  19,  19,  19,  59,  59,  99, 139, 179, 219, 259, 299, 339, 379;
      .VAR bits_vector_0[40]  =  0,  42,  67,  84,  97, 107, 116, 123, 129, 134, 139, 143, 147, 151, 154, 158, 161, 166, 171, 175, 179, 183, 186, 190, 193, 198, 203, 207, 211, 215, 218, 222, 225, 230, 235, 239, 243, 247, 250, 254;
      .VAR bits_vector_9[40]  =  0,  54,  91, 119, 142, 160, 176, 189, 201, 211, 221, 229, 237, 245, 251, 258, 264, 274, 284, 293, 301, 308, 315, 321, 327, 338, 348, 357, 365, 372, 379, 385, 391, 402, 412, 421, 429, 436, 443, 449;
      .VAR bits_vector_11[40] =  0,  61, 106, 142, 172, 197, 219, 238, 254, 270, 283, 296, 307, 318, 328, 337, 346, 362, 377, 390, 401, 412, 423, 432, 441, 457, 472, 485, 497, 508, 536, 545, 555, 572, 586, 599, 611, 622, 632, 641;
      .VAR bits_vector_12[40] =  0,  67, 118, 159, 195, 225, 252, 275, 297, 316, 334, 350, 365, 379, 392, 404, 415, 436, 455, 472, 488, 503, 538, 550, 561, 584, 602, 620, 636, 650, 664, 677, 689, 711, 730, 748, 764, 779, 793, 805;
      .VAR bits_vector_13[40] =  0,  72, 127, 173, 213, 248, 279, 306, 332, 355, 376, 395, 413, 430, 446, 461, 475, 501, 547, 568, 588, 606, 623, 639, 653, 680, 703, 725, 746, 764, 782, 797, 812, 839, 863, 885, 905, 924, 941, 956;
      .VAR bits_vector_14[40] =  0,  76, 135, 185, 228, 267, 301, 332, 361, 387, 411, 434, 455, 475, 493, 510, 551, 580, 609, 634, 658, 679, 698, 718, 735, 768, 796, 822, 846, 868, 889, 907, 925, 958, 995,1028,1055,1077,1098,1117;
      .VAR bits_vector_15[40] =  0,  83, 150, 207, 258, 304, 346, 384, 419, 452, 483, 512, 564, 588, 613, 636, 660, 700, 739, 773, 805, 835, 862, 888, 911, 956, 996,1041,1083,1118,1170,1195,1220,1268,1307,1345,1379,1409,1438,1466;
      .VAR bits_vector_16[40] =  0,  91, 165, 230, 288, 342, 391, 436, 479, 542, 581, 617, 651, 683, 715, 745, 774, 826, 876, 922, 973,1022,1064,1101,1134,1217,1274,1325,1372,1414,1455,1493,1530,1593,1649,1701,1749,1794,1836,1872;
      .VAR bits_vector_17[40] =  0,  99, 181, 253, 319, 380, 437, 491, 562, 611, 657, 701, 744, 783, 822, 858, 894, 970,1044,1107,1187,1238,1287,1336,1381,1464,1540,1609,1673,1733,1788,1839,1888,1978,2066,2155,2237,2323,2383,2434;
      .VAR bits_vector_18[40] =  0, 104, 192, 271, 343, 409, 472, 550, 609, 663, 715, 764, 812, 857, 902, 953,1001,1086,1185,1254,1322,1384,1442,1500,1556,1657,1750,1836,1924,2004,2079,2154,2225,2367,2497,2588,2674,2755,2830,2898;
   .ENDBLOCK;

   // -- square root of band widths (just for accuracy)
   .VAR ebands_dif_sqrt[19+2] = 
      -2,
      0.216506350946110,
      0.216506350946110,
      0.216506350946110,
      0.216506350946110,
      0.216506350946110,
      0.216506350946110,
      0.216506350946110,
      0.216506350946110,
      0.216506350946110,
      0.279508497187474,
      0.279508497187474,
      0.330718913883074,
      0.375000000000000,
      0.414578098794425,
      0.450693909432999,
      0.530330085889911,
      0.625000000000000,
      0.739509972887452,
      0.838525491562421,
      0.790569415042095;

   // -- trig data (used in MDCT/IMDCT pre-post rotation)
   .VAR/DM2 trig[12*2] = 
        0.909636042553129, //0.820335356007638,//long block data
        0.653671940958333,
        0.999914327574007,
        0.013089595571344,
        0.999998661349528,
        0.001636245443624,
        0.923252131736957,
        0.384194613761262,
        0.705948834368849,
        0.708262834866593,
        0.381171226410203,
        0.924504459782072, 
               
        0.719633298510876, //0.793700525984100,//short block data
        0.583594011237856, 
        0.999657324975557,
        0.026176948307873,
        0.999994645401696,
        0.003272486506527,
        0.922622259138823,
        0.385704766552831,
        0.704788997513670,
        0.709416992313883,
        0.379657999945233,
        0.925126911876195;
        
   // -- decoder scratch memory allocation (DM1)
   .VAR $celt.dec.celt_240_48000_mode.dm1scratch_alloc[$celt.dec.DM1_SCRATCH_FIELDS_LENGTH] =
      0,    //BITS1
      19,   //BITS2
      512,  //ALG_UNQUANT_ST
      640,  //UVECTOR
      0,    //NORM_FREQ
      512,  //BAND_E
      512,  //IMDCT_OUTPUT
      768,  //SHORT_HIST
      896,  //TEMP_FFT
      0,    //PLC_EXC
      0,    //PLC_PITCH_BUF
      512,  //PLC_XLP4 
      1024, //PLC_AC
      0;    //TRANSIENT_PROC
      
   // -- decoder scratch memory allocation (DM2)
   .VAR $celt.dec.celt_240_48000_mode.dm2scratch_alloc[$celt.dec.DM2_SCRATCH_FIELDS_LENGTH] =
      0,    //PULSES
      19,   //FINE_QUANT
      38,   //FINE_PRIORITY
      640,  //NORM
      0,    //FREQ
      256,  //FREQ2
      512,  //SHORT_FREQ
      0,    //PLC_EXC_COPY
      0,    //PLC_E
      0,    //PLC_YLP4
      512,  //PLC_MEM_LPC
      576,  //PLC_XCORR
      896;  //TEMP_VECT
      
   // -- encoder scratch memory allocation (DM1)
   .VAR $celt.enc.celt_240_48000_mode.dm1scratch_alloc[$celt.dec.DM1_SCRATCH_FIELDS_LENGTH] =               
      768,  //BITS1
      787,  //BITS2
      512,  //ALG_QUANT_ST
      640,  //UVECTOR_FIELD
      0,    //NORM_FREQ
      806,  //BANDE
      384,  //MDCT_INPUT_IMAG
      0,    //PREEMPH_LEFT_AUDIO
      896,  //LOG_BANDE_
      960,  //BAND_ERROR
      384,  //TRANSIENT
      0 ...;
      
   // -- encoder scratch memory allocation (DM2)
   .VAR $celt.enc.celt_240_48000_mode.dm2scratch_alloc[$celt.dec.DM2_SCRATCH_FIELDS_LENGTH] =
      768,  //PULSES
      787,  //FINE_QUANT
      806,  //FINE_PRIORITY
      256,  //NORM
      256,  //FREQ
      512,  //FREQ2
      0,    //SHORT_FREQ
      768,  //MDCT_INPUT_REAL
      1024, //PREEMPH_RIGHT_AUDIO
      512,  //ABS_NORM
      0 ...;
.ENDMODULE;
#endif
