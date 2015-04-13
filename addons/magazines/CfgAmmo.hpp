
class CfgAmmo {

    /* 6.5x39mm Grendel */

    // IR Dim
    class B_65x39_Caseless_yellow;
    class ACE_B_65x39_Caseless_Tracer_Dim: B_65x39_Caseless_yellow {
        nvgOnly = 1;
    };

    class B_65x39_Case_yellow;
    class ACE_B_65x39_Case_Tracer_Dim: B_65x39_Case_yellow {
        nvgOnly = 1;
    };

    // sub sonic
    class B_65x39_Caseless;
    class ACE_B_65x39_Caseless_SD: B_65x39_Caseless {
        airFriction = -0.00054;
        hit = 8.75;
        supersonicCrackFar[] = {};
        supersonicCrackNear[] = {};
        typicalSpeed = 320;
        audibleFire = 0.8;
        visibleFire = 2.5;
    };

    class B_65x39_Case;
    class ACE_B_65x39_Case_SD: B_65x39_Case {
        airFriction = -0.00054;
        hit = 8.75;
        supersonicCrackFar[] = {};
        supersonicCrackNear[] = {};
        typicalSpeed = 320;
        audibleFire = 0.8;
        visibleFire = 2.5;
    };

    // armor piercing
    class ACE_B_65x39_Caseless_AP: B_65x39_Caseless {
        caliber = 1.8;
        hit = 10.5;
    };

    class ACE_B_65x39_Case_AP: B_65x39_Case {
        caliber = 1.8;
        hit = 10.5;
    };


    /* 5.56x45mm NATO */

    // IR Dim
    class B_556x45_Ball_Tracer_Red;
    class ACE_B_556x45_Ball_Tracer_Dim: B_556x45_Ball_Tracer_Red {
        nvgOnly = 1;
    };

    // sub sonic
    class B_556x45_Ball;
    class ACE_B_556x45_Ball_SD: B_556x45_Ball {
        airFriction = -0.0006;
        hit = 7;
        supersonicCrackFar[] = {};
        supersonicCrackNear[] = {};
        typicalSpeed = 320;
        audibleFire = 0.6;
        visibleFire = 2.0;
    };

    // armor piercing
    class ACE_B_556x45_Ball_AP: B_556x45_Ball {
        caliber = 1.4;
        hit = 8.4;
    };


    /* 7.62x51mm NATO */

    // IR Dim
    class B_762x51_Tracer_Red;
    class ACE_B_762x51_Tracer_Dim: B_762x51_Tracer_Red {
        nvgOnly = 1;
    };

    // sub sonic
    class B_762x51_Ball;
    class ACE_B_762x51_Ball_SD: B_762x51_Ball {
        airFriction = -0.00048;
        hit = 10.5;
        supersonicCrackFar[] = {};
        supersonicCrackNear[] = {};
        typicalSpeed = 320;
        audibleFire = 0.9;
        visibleFire = 3.0;
    };

    // armor piercing
    class ACE_B_762x51_Ball_AP: B_762x51_Ball {
        caliber = 2.4;
        hit = 12.6;
    };

    // M118 LR
    class ACE_B_762x51_M118LR: B_762x51_Ball {
        //typicalspeed = 792;
        //airfriction = -0.0008577;
    };


    /* .338 Lapua Magnum */

    // IR Dim
    class B_338_Ball;
    class ACE_B_338_Ball_Tracer_Dim: B_338_Ball {
        nvgOnly = 1;
    };

    //AP
    class ACE_B_338_Ball_AP: B_338_Ball {
        caliber = 3.6;
        hit = 18.9;
    };

    //SD
    class ACE_B_338_Ball_SD: B_338_Ball {
        airFriction = -0.00036;
        hit = 15.75;
        supersonicCrackFar[] = {};
        supersonicCrackNear[] = {};
        typicalSpeed = 320;
        audibleFire = 1.2;
        visibleFire = 4.0;
    };


    /* .338 Norma Magnum */

    //IR Dim
    class B_338_NM_Ball;
    class ACE_B_338_NM_Ball_Tracer_Dim: B_338_NM_Ball {
        nvgOnly = 1;
    };
    
    //AP
    class ACE_B_338_NM_Ball_AP: B_338_NM_Ball {
        caliber = 3.2;
        hit = 16.8;
    };


    /* 9.3x64mm */

    //IR Dim
    class B_93x64_Ball;
    class ACE_B_93x64_Ball_Tracer_Dim: B_93x64_Ball {
        nvgOnly = 1;
    };

    //AP
    class ACE_B_93x64_Ball_AP: B_93x64_Ball {
        caliber = 4.0;
        hit = 21;
    };

    //SD
    class ACE_B_93x64_Ball_SD: B_93x64_Ball {
        airFriction = -0.00042;
        hit = 17.5;
        supersonicCrackFar[] = {};
        supersonicCrackNear[] = {};
        typicalSpeed = 320;
        audibleFire = 1.2;
        visibleFire = 4.0;
    };
};
