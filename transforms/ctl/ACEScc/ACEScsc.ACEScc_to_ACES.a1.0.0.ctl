//
// ACES Color Space Conversion - ACEScc to ACES
//
// converts AP1 w/ ACESlog encoding to ACES2065-1 (AP0 w/ linear encoding)
//



import "ACESlib.Transform_Common.a1.0.0";



void main
(   
    input varying float rIn,
    input varying float gIn,
    input varying float bIn,
    input varying float aIn,
    output varying float rOut,
    output varying float gOut,
    output varying float bOut,
    output varying float aOut
)
{
    float AP1_lin[3];
    AP1_lin[0] = acesLog_to_lin( rIn);
    AP1_lin[1] = acesLog_to_lin( gIn);
    AP1_lin[2] = acesLog_to_lin( bIn);

    float aces[3] = mult_f3_f44( AP1_lin, AP1_2_AP0_MAT);

    rOut = aces[0];
    gOut = aces[1];
    bOut = aces[2];
    aOut = aIn;
}