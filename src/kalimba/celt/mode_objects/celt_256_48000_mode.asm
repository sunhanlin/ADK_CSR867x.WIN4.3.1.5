// *****************************************************************************
// Copyright (c) 2017 Qualcomm Technologies International, Ltd.        
// All Rights Reserved. 
// Notifications and licenses (if any) are retained for attribution purposes only.     
// Part of ADK_CSR867x.WIN 4.3
//
// *****************************************************************************

#ifndef CELT_MODE_256_48000_INCLUDED
#define CELT_MODE_256_48000_INCLUDED

#include "../celt_library.h"

// *****************************************************************************
// MODULE:
//    $celt.celt_256_48000_mode 
//
// DESCRIPTION:
//    Mode object for N=256 and fs = 48000Hz
//
// *****************************************************************************
.MODULE $M.celt.mode.celt_256_48000_mode;
.DATASEGMENT DM;
   // -- Definition of mode object
   .VAR $celt.mode.celt_256_48000_mode[$celt.mode.STRUC_SIZE] = 
      48000,             // Fs
      128,               // overlap
      256,               // mdctSize
      19,                // nbEBands
      21,                // pitchEnd
      0.8,               // ePredCoef
      12,                // nbAllocVectors
      2,                 // nbShortMdcts
      128,               // shortMdctSize
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
   .VAR eBands[19+2] = 0,  3,  6,  9,  12,  15,  18,  21,  25,  29,  34,  40,  47,  56,  68,  82,  101,  128,  165,  213,  256;
   
   // -- Allocation vectors
   .VAR allocVectors[228] = 			
      4,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  
      5,    4,    3,    2,    1,    1,    1,    1,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  
      6,    4,    4,    3,    3,    2,    4,    6,    7,    7,    7,    5,    4,    0,    0,    0,    0,    0,    0,  
      6,    7,    6,    5,    4,    4,    5,    7,    8,    8,    8,    6,    5,    4,    0,    0,    0,    0,    0,  
      7,    7,    8,    7,    6,    5,    6,    8,    9,    9,    9,    7,    6,    5,    5,    5,    0,    0,    0,  
      8,    11,   12,   10,   8,    8,    7,    10,   10,   10,   10,   8,    6,    5,    5,    5,    5,    1,    0,  
      9,    14,   14,   12,   11,   11,   9,    11,   11,   10,   10,   8,    9,    8,    11,   10,   10,   1,    0,  
      14,   17,   14,   13,   12,   12,   10,   14,   12,   11,   12,   16,   11,   15,   15,   20,   18,   10,   1,  
      19,   20,   16,   15,   15,   14,   14,   20,   18,   22,   22,   25,   27,   40,   37,   38,   40,   35,   1,  
      20,   21,   19,   18,   19,   21,   20,   28,   28,   33,   32,   33,   36,   39,   42,   50,   60,   54,   31,  
      23,   21,   21,   25,   30,   29,   28,   35,   35,   43,   46,   47,   52,   62,   63,   62,   73,   81,   62,  
      25,   29,   31,   38,   44,   42,   40,   53,   54,   64,   66,   66,   80,   92,   93,   91,   93,   101,  92;
      
   // -- Window
   .VAR/DM2 window[128] =			
      0.000059139038058,  0.000532197882421,  0.001478030113503,  0.002896063495427,  0.004785436205566,  0.007144992705435,  0.009973277337849,  0.013268529437482,  
      0.017028674483299,  0.021251311525702,  0.025933710858226,  0.031072795391083,  0.036665130406618,  0.042706914246082,  0.049193959683180,  0.056121692061424,  
      0.063485108315945,  0.071278803050518,  0.079496912658215,  0.088133141398430,  0.097180701792240,  0.106632351875305,  0.116480343043804,  0.126716434955597,  
      0.137331858277321,  0.148317337036133,  0.159663051366806,  0.171358674764633,  0.183393299579620,  0.195755511522293,  0.208433344960213,  0.221414253115654,  
      0.234685227274895,  0.248232662677765,  0.262042462825775,  0.276100039482117,  0.290390282869339,  0.304897606372833,  0.319605946540833,  0.334498882293701,  
      0.349559515714645,  0.364770591259003,  0.380114465951920,  0.395573228597641,  0.411128699779511,  0.426762402057648,  0.442455708980560,  0.458189755678177,  
      0.473945677280426,  0.489704459905624,  0.505447089672089,  0.521154582500458,  0.536808073520660,  0.552388727664948,  0.567878007888794,  0.583257555961609,  
      0.598509252071381,  0.613615453243256,  0.628558754920959,  0.643322288990021,  0.657889604568481,  0.672244906425476,  0.686372935771942,  0.700258910655975,  
      0.713888943195343,  0.727249741554260,  0.740328788757324,  0.753114342689514,  0.765595495700836,  0.777762115001678,  0.789605021476746,  0.801115870475769,  
      0.812287271022797,  0.823112726211548,  0.833586633205414,  0.843704402446747,  0.853462278842926,  0.862857580184937,  0.871888458728790,  0.880554080009460,  
      0.888854384422302,  0.896790385246277,  0.904363751411438,  0.911577284336090,  0.918434441089630,  0.924939453601837,  0.931097447872162,  0.936914145946503,  
      0.942396163940430,  0.947550535202026,  0.952385127544403,  0.956908285617828,  0.961128890514374,  0.965056359767914,  0.968700468540192,  0.972071409225464,  
      0.975179851055145,  0.978036582469940,  0.980652749538422,  0.983039617538452,  0.985208690166473,  0.987171590328217,  0.988939821720123,  0.990525066852570,  
      0.991939008235931,  0.993192970752716,  0.994298517704010,  0.995266735553741,  0.996108710765839,  0.996835112571716,  0.997456431388855,  0.997982800006866,  
      0.998423933982849,  0.998789250850677,  0.999087631702423,  0.999327600002289,  0.999517142772675,  0.999663650989532,  0.999774158000946,  0.999854981899261,  
      0.999911963939667,  0.999950289726257,  0.999974489212036,  0.999988555908203,  0.999995827674866,  0.999998927116394,  0.999999880790710,  1.000000000000000;
      
   // -- Prob vector     
   .VAR prob[76] =			
      6000,   15200,   5800,   15632,  
      5600,   16072,   5400,   16522,  
      5200,   16978,   5000,   17444,  
      4800,   17918,   4600,   18400,  
      4400,   18892,   4200,   19394,  
      4000,   19906,   3800,   20428,  
      3600,   20962,   3400,   21504,  
      3200,   22058,   3000,   22624,  
      2800,   23202,   2600,   23792,  
      2400,   24394,   9000,    9530,  
      8760,    9934,   8520,   10346,  
      8280,   10766,   8040,   11194,  
      7800,   11630,   7560,   12074,  
      7320,   12528,   7080,   12992,  
      6840,   13466,   6600,   13948,  
      6360,   14440,   6120,   14944,  
      5880,   15458,   5640,   15984,  
      5400,   16522,   5160,   17070,  
      4920,   17632,   4680,   18206;
      
   // -- bits verctors      
   .BLOCK/DM bits;
      .VAR bits_vector_offset[19] =  19,  19,  19,  19,  19,  19,  19,  59,  59,  99,  139,  179,  219,  259,  299,  339,  379,  419,  459;
      .VAR bits_vector_0[40] =   0,   42,   67,   84,   97,  107,  116,  123,  129,  134,  139,  143,  147,  151,  154,  158,  161,  166,  171,  175,  179,  183,  186,  190,  193,  198,  203,  207,  211,  215,  218,  222,  225,  230,  235,  239,  243,  247,  250,  254;
      .VAR bits_vector_7[40] =   0,   48,   80,  104,  122,  136,  148,  159,  168,  176,  183,  190,  196,  201,  206,  211,  215,  223,  231,  237,  243,  249,  254,  259,  263,  271,  279,  285,  291,  297,  302,  307,  311,  319,  327,  333,  339,  345,  350,  355;
      .VAR bits_vector_9[40] =   0,   54,   91,  119,  142,  160,  176,  189,  201,  211,  221,  229,  237,  245,  251,  258,  264,  274,  284,  293,  301,  308,  315,  321,  327,  338,  348,  357,  365,  372,  379,  385,  391,  402,  412,  421,  429,  436,  443,  449;
      .VAR bits_vector_10[40] =  0,   58,   99,  132,  158,  180,  199,  215,  229,  242,  254,  265,  274,  283,  292,  300,  307,  320,  332,  343,  353,  362,  371,  379,  386,  400,  412,  423,  433,  442,  451,  459,  466,  480,  492,  503,  528,  538,  547,  555;
      .VAR bits_vector_11[40] =  0,   61,  106,  142,  172,  197,  219,  238,  254,  270,  283,  296,  307,  318,  328,  337,  346,  362,  377,  390,  401,  412,  423,  432,  441,  457,  472,  485,  497,  508,  536,  545,  555,  572,  586,  599,  611,  622,  632,  641;
      .VAR bits_vector_12[40] =  0,   67,  118,  159,  195,  225,  252,  275,  297,  316,  334,  350,  365,  379,  392,  404,  415,  436,  455,  472,  488,  503,  538,  550,  561,  584,  602,  620,  636,  650,  664,  677,  689,  711,  730,  748,  764,  779,  793,  805;
      .VAR bits_vector_13[40] =  0,   74,  131,  179,  221,  258,  290,  320,  347,  371,  394,  415,  435,  453,  470,  486,  502,  552,  579,  603,  623,  643,  662,  680,  695,  724,  750,  774,  796,  817,  836,  853,  870,  900,  926,  950,  972,  992, 1012, 1029;
      .VAR bits_vector_14[40] =  0,   77,  138,  190,  235,  275,  311,  344,  374,  402,  428,  451,  474,  495,  539,  556,  574,  608,  637,  665,  689,  713,  734,  754,  773,  808,  840,  868,  893,  917,  940,  959,  979, 1014, 1046, 1084, 1116, 1142, 1182, 1202;
      .VAR bits_vector_15[40] =  0,   84,  152,  211,  263,  310,  353,  393,  429,  463,  495,  549,  578,  605,  630,  654,  678,  721,  761,  797,  830,  862,  890,  918,  943, 1003, 1052, 1092, 1129, 1179, 1213, 1242, 1268, 1316, 1360, 1399, 1436, 1468, 1498, 1526;
      .VAR bits_vector_16[40] =  0,   93,  169,  235,  296,  351,  401,  449,  493,  557,  598,  636,  672,  706,  739,  770,  801,  857,  911,  973, 1025, 1071, 1110, 1170, 1206, 1273, 1332, 1387, 1437, 1484, 1527, 1567, 1606, 1678, 1739, 1795, 1845, 1894, 1939, 1980;
      .VAR bits_vector_17[40] =  0,  100,  183,  257,  325,  387,  445,  499,  572,  622,  670,  715,  759,  800,  840,  877,  919, 1001, 1072, 1134, 1217, 1271, 1321, 1371, 1419, 1506, 1586, 1658, 1725, 1789, 1847, 1903, 1962, 2064, 2152, 2241, 2329, 2408, 2493, 2549;
      .VAR bits_vector_18[40] =  0,  106,  195,  275,  349,  417,  481,  560,  621,  676,  730,  780,  830,  876,  923,  973, 1023, 1112, 1215, 1285, 1355, 1420, 1484, 1543, 1601, 1704, 1804, 1894, 1980, 2068, 2156, 2240, 2327, 2476, 2590, 2692, 2779, 2864, 2946, 3021;
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
      0.250000000000000,
      0.250000000000000,
      0.279508497187474,
      0.306186217847897,
      0.330718913883074,
      0.375000000000000,
      0.433012701892219,
      0.467707173346743,
      0.544862367942584,
      0.649519052838329,
      0.760345316287277,
      0.866025403784439,
      0.819679815537750;

   // -- trig data (used in MDCT/IMDCT pre-post rotation)
   .VAR/DM2 trig[12*2] = 
        0.820335356007638,//long block data
        0.672950096316178,
        0.999924701839145,     
        0.012271538285720, 
        0.999998823451702, 
        0.001533980186285, 
        0.923291416719528, 
        0.384100195016935, 
        0.706021261449340, 
        0.708190637033195, 
        0.381265769222162, 
        0.924465474325263, 
               
        0.793700525984100,//short block data
        0.707106781186547, 
        0.999698818696204, 
        0.024541228522912, 
        0.999995293809576, 
        0.003067956762966, 
        0.922701128333879, 
        0.385516053843919, 
        0.704934080375905, 
        0.709272826438866, 
        0.379847208924051, 
        0.925049240782678;
        
   // -- decoder scratch memory allocation (DM1)
   .VAR $celt.dec.celt_256_48000_mode.dm1scratch_alloc[$celt.dec.DM1_SCRATCH_FIELDS_LENGTH] =
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
   .VAR $celt.dec.celt_256_48000_mode.dm2scratch_alloc[$celt.dec.DM2_SCRATCH_FIELDS_LENGTH] =
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
   .VAR $celt.enc.celt_256_48000_mode.dm1scratch_alloc[$celt.dec.DM1_SCRATCH_FIELDS_LENGTH] =               
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
   .VAR $celt.enc.celt_256_48000_mode.dm2scratch_alloc[$celt.dec.DM2_SCRATCH_FIELDS_LENGTH] =
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