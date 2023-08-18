CALL sf org create scratch ^
    --alias %1 ^
    --definition-file config\project-scratch-def.json ^
    --duration-days 30 ^
    --edition enterprise ^ 
    --wait 45 & ^
CALL sf project deploy --metadata ApexClass:MetadataService -o %1 -w 45 & ^
CALL sf apex run --file .\scripts\apex\create_scratch_org.apex -o %1 & ^
CALL sf package install --package 04t4W000002g3o3QAA -o %1 -w 45 & ^
CALL sf org open -o %1