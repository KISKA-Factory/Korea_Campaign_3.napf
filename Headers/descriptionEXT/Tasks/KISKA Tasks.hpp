class KISKA_cfgTasks
{
    class exampleTask_base // class name will become Task Id
    {
        title = "My Example Task";
        description = "This is an example";

        parentTask = ""; // Parent Task Id
        type = ""; // task type as defined in CfgTaskTypes

        // params for these are:
        // 0: task id (or class name) (STRING)
        // 1: config path (CONFIG)
        // 2: task state (STRING)
        onComplete = ""; // code that runs upon completion of task when using KISKA_fnc_endTask
        onCreate = ""; // code that runs on creation of task when using KISKA_fnc_createTaskFromConfig

        destination[] = {}; // position of task
        compiledDestination = ""; // uncompiled code that needs to return an object, this will overwrite the destination[] property which will only be used if the object returned is null

        defaultState = ""; // "CREATED", "ASSIGNED", "AUTOASSIGNED" (default), "SUCCEEDED", "FAILED", or "CANCELED"
        priority = -1;
        notifyOnComplete = ON;
        notifyOnCreate = ON;



        visibleIn3D = OFF; // 3d marker creation
    };

    class area_base
    {
        type = TASK_TYPE_KILL;
        priority = -1;
        notifyOnComplete = ON;
        visibleIn3D = OFF;
    };
    class site_base
    {
        type = TASK_TYPE_ATTACK;
        notifyOnComplete = ON;
    };

    /* ----------------------------------------------------------------------------
        Area 1
    ---------------------------------------------------------------------------- */
    class Area1_Task : area_base
    {
        title = "Clear Camps In Area 1";
        compiledDestination = "markerPos 'Area1_marker'";
        onComplete = "deleteMarker 'Area1_marker'";
    };
    class Site2_clearTask : site_base
    {
        title = "Area 1 - Site 1";
        parentTask = "Area1_Task";
        
    };
    class Site3_clearTask : Site2_clearTask
    {
        title = "Area 1 - Site 2";
    };

    /* ----------------------------------------------------------------------------
        Area 2
    ---------------------------------------------------------------------------- */
    class Area2_Task : area_base
    {
        title = "Clear Camps In Area 2";
        compiledDestination = "markerPos 'Area2_marker'";
        onComplete = "deleteMarker 'Area2_marker'";
    };
    class Site7_clearTask : site_base
    {
        title = "Area 2 - Site 1";
        parentTask = "Area2_Task";
    };
    class Site8_clearTask : Site7_clearTask
    {
        title = "Area 2 - Site 2";
    };
    class Site9_clearTask : Site7_clearTask
    {
        title = "Area 2 - Site 3";
    };

    /* ----------------------------------------------------------------------------
        Area 3
    ---------------------------------------------------------------------------- */
    class Area3_Task : area_base
    {
        title = "Clear Camps In Area 3";
        compiledDestination = "markerPos 'Area3_marker'";
        onComplete = "deleteMarker 'Area3_marker'";
    };
    class Site11_clearTask : site_base
    {
        title = "Area 3 - Site 1";
        parentTask = "Area3_Task";
    };


    /* ----------------------------------------------------------------------------
        Area 4
    ---------------------------------------------------------------------------- */
    class Area4_Task : area_base
    {
        title = "Clear Camps In Area 4";
        compiledDestination = "markerPos 'Area4_marker'";
        onComplete = "deleteMarker 'Area4_marker'";
    };
    class Site10_clearTask : site_base
    {
        title = "Area 4 - Site 1";
        parentTask = "Area4_Task";
    };

    /* ----------------------------------------------------------------------------
        Area 5
    ---------------------------------------------------------------------------- */
    class Area5_Task : area_base
    {
        title = "Clear Camps In Area 5";
        compiledDestination = "markerPos 'Area5_marker'";
        onComplete = "deleteMarker 'Area5_marker'";
    };
    class Site4_clearTask : site_base
    {
        title = "Area 5 - Site 1";
        parentTask = "Area5_Task";
    };
    class Site6_clearTask : Site4_clearTask
    {
        title = "Area 5 - Site 2";
    };

    /* ----------------------------------------------------------------------------
        Area 6
    ---------------------------------------------------------------------------- */
    class Area6_Task : area_base
    {
        title = "Clear Camps In Area 6";
        compiledDestination = "markerPos 'Area6_marker'";
        onComplete = "deleteMarker 'Area6_marker'";
    };
    class Site5_clearTask : site_base
    {
        title = "Area 6 - Site 1";
        parentTask = "Area6_Task";
    };
};
