#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/fetchngs
========================================================================================
    Github : https://github.com/nf-core/fetchngs
    Website: https://nf-co.re/fetchngs
    Slack  : https://nfcore.slack.com/channels/fetchngs
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

workflow NFCORE_FETCHNGS {

    //
    // WORKFLOW: Run main nf-core/fetchngs analysis pipeline
    //
    include { FETCHNGS } from './workflows/fetchngs'
    FETCHNGS ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_FETCHNGS ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
