CREATE TABLE classExtension (uuid varchar(32) not null, answers varchar(255), description varchar(255), entityClass varchar(255), name varchar(255) not null, primType varchar(255), roundNumber integer, primary key (uuid)); 
CREATE TABLE death (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), ageAtDeath bigint, deathCause varchar(255), deathDate date not null, deathPlace varchar(255), insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, individual_uuid varchar(32), visitDeath_uuid varchar(32), primary key (uuid));
CREATE TABLE extension (uuid varchar(32) not null, entityExtId varchar(255) not null, extensionValue varchar(255) not null, classExtension_uuid varchar(32), entity_uuid varchar(32), primary key (uuid));
CREATE TABLE fieldworker (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), extId varchar(255) not null, firstName varchar(255), lastName varchar(255), insertBy_uuid varchar(32), voidBy_uuid varchar(32), primary key (uuid));
CREATE TABLE individual (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), dob date, dobAspect varchar(255), extId varchar(255) not null unique, firstName varchar(255), gender varchar(255), lastName varchar(255), middleName varchar(255), workStatus varchar(255), insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, father_uuid varchar(32), mother_uuid varchar(32), primary key (uuid)); 
CREATE TABLE inmigration (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), migType varchar(255), origin varchar(255), reason varchar(255), recordedDate date not null, unknownIndividual bit, insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, individual_uuid varchar(32) not null, residency_uuid varchar(32) not null, visit_uuid varchar(32) not null, primary key (uuid));
CREATE TABLE location (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), extId varchar(255) not null, locationName varchar(255), locationType varchar(255), numberOfHouseholds integer not null, insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, locationHead_uuid varchar(32), locationLevel_uuid varchar(32), primary key (uuid));
CREATE TABLE locationhierarchy (uuid varchar(32) not null, extId varchar(255) not null, name varchar(255) not null, level_uuid varchar(32), parent_uuid varchar(32), primary key (uuid));
CREATE TABLE locationhierarchylevel (uuid varchar(32) not null, keyIdentifier integer not null, name varchar(255) not null, primary key (uuid));
CREATE TABLE membership (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), bIsToA varchar(255), endDate date, endType varchar(255), startDate date, startType varchar(255), insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, individual_uuid varchar(32), socialGroup_uuid varchar(32), primary key (uuid));
CREATE TABLE note (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), description varchar(255), insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, primary key (uuid));
CREATE TABLE outcome (uuid varchar(32) not null, type varchar(255), child_uuid varchar(32), childMembership_uuid varchar(32), primary key (uuid));
CREATE TABLE outmigration (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), destination varchar(255), reason varchar(255), recordedDate date not null, insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, individual_uuid varchar(32) not null, residency_uuid varchar(32) not null, visit_uuid varchar(32), primary key (uuid));
CREATE TABLE pregnancyobservation (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), expectedDeliveryDate date not null, recordedDate date not null, insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, mother_uuid varchar(32), primary key (uuid));
CREATE TABLE pregnancyoutcome (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), childEverBorn integer, numberOfLiveBirths integer, outcomeDate date, insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, father_uuid varchar(32), mother_uuid varchar(32), visit_uuid varchar(32), primary key (uuid));
CREATE TABLE pregnancyoutcome_outcome (pregnancyoutcome_uuid varchar(32) not null, outcomes_uuid varchar(32) not null, unique (outcomes_uuid));
CREATE TABLE privilege (uuid varchar(32) not null, privilege varchar(255), primary key (uuid));
CREATE TABLE relationship (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), aIsToB varchar(255), endDate date, endType varchar(255), startDate date not null, insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, individualA_uuid varchar(32), individualB_uuid varchar(32), primary key (uuid));
CREATE TABLE residency (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), endDate date, endType varchar(255), startDate date not null, startType varchar(255), insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, individual_uuid varchar(32), location_uuid varchar(32), primary key (uuid));
CREATE TABLE role (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), description varchar(255), name varchar(255), insertBy_uuid varchar(32), voidBy_uuid varchar(32), primary key (uuid));
CREATE TABLE role_privileges (role_uuid varchar(32) not null, privilege_uuid varchar(32) not null, primary key (role_uuid, privilege_uuid));
CREATE TABLE round (uuid varchar(32) not null, endDate date, remarks varchar(255), roundNumber integer, startDate date, primary key (uuid));
CREATE TABLE socialgroup (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), dateOfInterview date, extId varchar(255) unique, groupName varchar(255), groupType varchar(255), insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, groupHead_uuid varchar(32), respondent_uuid varchar(32), primary key (uuid));
CREATE TABLE user (uuid varchar(32) not null, deleted bit not null, description varchar(255), firstName varchar(255), fullName varchar(255), lastLoginTime bigint not null, lastName varchar(255), password varchar(255), sessionId varchar(255), username varchar(255), primary key (uuid));
CREATE TABLE user_roles (user_uuid varchar(32) not null, role_uuid varchar(32) not null, primary key (user_uuid, role_uuid));
CREATE TABLE visit (uuid varchar(32) not null, deleted bit not null, insertDate date, voidDate datetime, voidReason varchar(255), status varchar(255), statusMessage varchar(255), extId varchar(255), roundNumber integer, visitDate date not null, insertBy_uuid varchar(32), voidBy_uuid varchar(32), collectedBy_uuid varchar(32) not null, visitLocation_uuid varchar(32), primary key (uuid));
CREATE TABLE whitelist (uuid varchar(32) not null, address varchar(255), primary key (uuid));
ALTER TABLE death add index FK5B0927497735AF9 (insertBy_uuid), add constraint FK5B0927497735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE death add index FK5B0927436F4BE6E (collectedBy_uuid), add constraint FK5B0927436F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE death add index FK5B09274A726FBE (voidBy_uuid), add constraint FK5B09274A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE death add index FK5B0927468E8A298 (visitDeath_uuid), add constraint FK5B0927468E8A298 foreign key (visitDeath_uuid) references visit (uuid);
ALTER TABLE death add index FK5B0927480470E9E (individual_uuid), add constraint FK5B0927480470E9E foreign key (individual_uuid) references individual (uuid);
ALTER TABLE extension add index FKDB7D1C3FEA9B72FE (entity_uuid), add constraint FKDB7D1C3FEA9B72FE foreign key (entity_uuid) references visit (uuid);
ALTER TABLE extension add index FKDB7D1C3FE3D6A93E (classExtension_uuid), add constraint FKDB7D1C3FE3D6A93E foreign key (classExtension_uuid) references classExtension (uuid);
ALTER TABLE fieldworker add index FK528ED0F897735AF9 (insertBy_uuid), add constraint FK528ED0F897735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE fieldworker add index FK528ED0F8A726FBE (voidBy_uuid), add constraint FK528ED0F8A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE individual add index FKFD3DA29997735AF9 (insertBy_uuid), add constraint FKFD3DA29997735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE individual add index FKFD3DA2999E4C80B4 (mother_uuid), add constraint FKFD3DA2999E4C80B4 foreign key (mother_uuid) references individual (uuid);
ALTER TABLE individual add index FKFD3DA29936F4BE6E (collectedBy_uuid), add constraint FKFD3DA29936F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE individual add index FKFD3DA299A726FBE (voidBy_uuid), add constraint FKFD3DA299A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE individual add index FKFD3DA29930076DBB (father_uuid), add constraint FKFD3DA29930076DBB foreign key (father_uuid) references individual (uuid);
ALTER TABLE inmigration add index FKD692204997735AF9 (insertBy_uuid), add constraint FKD692204997735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE inmigration add index FKD692204936F4BE6E (collectedBy_uuid), add constraint FKD692204936F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE inmigration add index FKD6922049A726FBE (voidBy_uuid), add constraint FKD6922049A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE inmigration add index FKD6922049851505F6 (residency_uuid), add constraint FKD6922049851505F6 foreign key (residency_uuid) references residency (uuid);
ALTER TABLE inmigration add index FKD6922049301AAA96 (visit_uuid), add constraint FKD6922049301AAA96 foreign key (visit_uuid) references visit (uuid);
ALTER TABLE inmigration add index FKD692204980470E9E (individual_uuid), add constraint FKD692204980470E9E foreign key (individual_uuid) references individual (uuid);
ALTER TABLE location add index FK714F9FB597735AF9 (insertBy_uuid), add constraint FK714F9FB597735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE location add index FK714F9FB536F4BE6E (collectedBy_uuid), add constraint FK714F9FB536F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE location add index FK714F9FB5237F13A2 (locationHead_uuid), add constraint FK714F9FB5237F13A2 foreign key (locationHead_uuid) references individual (uuid);
ALTER TABLE location add index FK714F9FB5A726FBE (voidBy_uuid), add constraint FK714F9FB5A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE location add index FK714F9FB5DFDC7027 (locationLevel_uuid), add constraint FK714F9FB5DFDC7027 foreign key (locationLevel_uuid) references locationhierarchy (uuid);
ALTER TABLE locationhierarchy add index FK6AD2CE20F61555E (level_uuid), add constraint FK6AD2CE20F61555E foreign key (level_uuid) references locationhierarchylevel (uuid);
ALTER TABLE locationhierarchy add index FK6AD2CE2064C0094C (parent_uuid), add constraint FK6AD2CE2064C0094C foreign key (parent_uuid) references locationhierarchy (uuid);
ALTER TABLE membership add index FKB01D87D691408DD6 (socialGroup_uuid), add constraint FKB01D87D691408DD6 foreign key (socialGroup_uuid) references socialgroup (uuid);
ALTER TABLE membership add index FKB01D87D697735AF9 (insertBy_uuid), add constraint FKB01D87D697735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE membership add index FKB01D87D636F4BE6E (collectedBy_uuid), add constraint FKB01D87D636F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE membership add index FKB01D87D6A726FBE (voidBy_uuid), add constraint FKB01D87D6A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE membership add index FKB01D87D680470E9E (individual_uuid), add constraint FKB01D87D680470E9E foreign key (individual_uuid) references individual (uuid);
ALTER TABLE note add index FK33AFF297735AF9 (insertBy_uuid), add constraint FK33AFF297735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE note add index FK33AFF236F4BE6E (collectedBy_uuid), add constraint FK33AFF236F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE note add index FK33AFF2A726FBE (voidBy_uuid), add constraint FK33AFF2A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE outcome add index FKBE0C075286CD7C22 (childMembership_uuid), add constraint FKBE0C075286CD7C22 foreign key (childMembership_uuid) references membership (uuid);
ALTER TABLE outcome add index FKBE0C0752948ED5FB (child_uuid), add constraint FKBE0C0752948ED5FB foreign key (child_uuid) references individual (uuid);
ALTER TABLE outmigration add index FKE109DC4097735AF9 (insertBy_uuid), add constraint FKE109DC4097735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE outmigration add index FKE109DC4036F4BE6E (collectedBy_uuid), add constraint FKE109DC4036F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE outmigration add index FKE109DC40A726FBE (voidBy_uuid), add constraint FKE109DC40A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE outmigration add index FKE109DC40851505F6 (residency_uuid), add constraint FKE109DC40851505F6 foreign key (residency_uuid) references residency (uuid);
ALTER TABLE outmigration add index FKE109DC40301AAA96 (visit_uuid), add constraint FKE109DC40301AAA96 foreign key (visit_uuid) references visit (uuid);
ALTER TABLE outmigration add index FKE109DC4080470E9E (individual_uuid), add constraint FKE109DC4080470E9E foreign key (individual_uuid) references individual (uuid);
ALTER TABLE pregnancyobservation add index FKDB9E9ADF97735AF9 (insertBy_uuid), add constraint FKDB9E9ADF97735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE pregnancyobservation add index FKDB9E9ADF9E4C80B4 (mother_uuid), add constraint FKDB9E9ADF9E4C80B4 foreign key (mother_uuid) references individual (uuid);
ALTER TABLE pregnancyobservation add index FKDB9E9ADF36F4BE6E (collectedBy_uuid), add constraint FKDB9E9ADF36F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE pregnancyobservation add index FKDB9E9ADFA726FBE (voidBy_uuid), add constraint FKDB9E9ADFA726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE pregnancyoutcome add index FKA53B1B8597735AF9 (insertBy_uuid), add constraint FKA53B1B8597735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE pregnancyoutcome add index FKA53B1B859E4C80B4 (mother_uuid), add constraint FKA53B1B859E4C80B4 foreign key (mother_uuid) references individual (uuid);
ALTER TABLE pregnancyoutcome add index FKA53B1B8536F4BE6E (collectedBy_uuid), add constraint FKA53B1B8536F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE pregnancyoutcome add index FKA53B1B85A726FBE (voidBy_uuid), add constraint FKA53B1B85A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE pregnancyoutcome add index FKA53B1B8530076DBB (father_uuid), add constraint FKA53B1B8530076DBB foreign key (father_uuid) references individual (uuid);
ALTER TABLE pregnancyoutcome add index FKA53B1B85301AAA96 (visit_uuid), add constraint FKA53B1B85301AAA96 foreign key (visit_uuid) references visit (uuid);
ALTER TABLE pregnancyoutcome_outcome add index FKC419749895ECD547 (outcomes_uuid), add constraint FKC419749895ECD547 foreign key (outcomes_uuid) references outcome (uuid);
ALTER TABLE pregnancyoutcome_outcome add index FKC4197498AFA9FEFE (pregnancyoutcome_uuid), add constraint FKC4197498AFA9FEFE foreign key (pregnancyoutcome_uuid) references pregnancyoutcome (uuid);
ALTER TABLE relationship add index FKF064763897735AF9 (insertBy_uuid), add constraint FKF064763897735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE relationship add index FKF064763836F4BE6E (collectedBy_uuid), add constraint FKF064763836F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE relationship add index FKF0647638A726FBE (voidBy_uuid), add constraint FKF0647638A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE relationship add index FKF0647638995599AF (individualA_uuid), add constraint FKF0647638995599AF foreign key (individualA_uuid) references individual (uuid);
ALTER TABLE relationship add index FKF06476389B0A724E (individualB_uuid), add constraint FKF06476389B0A724E foreign key (individualB_uuid) references individual (uuid);
ALTER TABLE residency add index FK7E9A5B1A97735AF9 (insertBy_uuid), add constraint FK7E9A5B1A97735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE residency add index FK7E9A5B1A36F4BE6E (collectedBy_uuid), add constraint FK7E9A5B1A36F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE residency add index FK7E9A5B1AA726FBE (voidBy_uuid), add constraint FK7E9A5B1AA726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE residency add index FK7E9A5B1AB374291E (location_uuid), add constraint FK7E9A5B1AB374291E foreign key (location_uuid) references location (uuid);
ALTER TABLE residency add index FK7E9A5B1A80470E9E (individual_uuid), add constraint FK7E9A5B1A80470E9E foreign key (individual_uuid) references individual (uuid);
ALTER TABLE role add index FK35807697735AF9 (insertBy_uuid), add constraint FK35807697735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE role add index FK358076A726FBE (voidBy_uuid), add constraint FK358076A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE role_privileges add index FK797EEF4B21E9AC56 (privilege_uuid), add constraint FK797EEF4B21E9AC56 foreign key (privilege_uuid) references privilege (uuid);
ALTER TABLE role_privileges add index FK797EEF4B1920CBBE (role_uuid), add constraint FK797EEF4B1920CBBE foreign key (role_uuid) references role (uuid);
ALTER TABLE socialgroup add index FK89CF7B329001C018 (groupHead_uuid), add constraint FK89CF7B329001C018 foreign key (groupHead_uuid) references individual (uuid);
ALTER TABLE socialgroup add index FK89CF7B3297735AF9 (insertBy_uuid), add constraint FK89CF7B3297735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE socialgroup add index FK89CF7B3236F4BE6E (collectedBy_uuid), add constraint FK89CF7B3236F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE socialgroup add index FK89CF7B32DA2DE721 (respondent_uuid), add constraint FK89CF7B32DA2DE721 foreign key (respondent_uuid) references individual (uuid);
ALTER TABLE socialgroup add index FK89CF7B32A726FBE (voidBy_uuid), add constraint FK89CF7B32A726FBE foreign key (voidBy_uuid) references user (uuid);
ALTER TABLE user_roles add index FK73429949195798DE (user_uuid), add constraint FK73429949195798DE foreign key (user_uuid) references user (uuid);
ALTER TABLE user_roles add index FK734299491920CBBE (role_uuid), add constraint FK734299491920CBBE foreign key (role_uuid) references role (uuid);
ALTER TABLE visit add index FK6B04D4B97735AF9 (insertBy_uuid), add constraint FK6B04D4B97735AF9 foreign key (insertBy_uuid) references user (uuid);
ALTER TABLE visit add index FK6B04D4B36F4BE6E (collectedBy_uuid), add constraint FK6B04D4B36F4BE6E foreign key (collectedBy_uuid) references fieldworker (uuid);
ALTER TABLE visit add index FK6B04D4BEC630DB3 (visitLocation_uuid), add constraint FK6B04D4BEC630DB3 foreign key (visitLocation_uuid) references location (uuid);
ALTER TABLE visit add index FK6B04D4BA726FBE (voidBy_uuid), add constraint FK6B04D4BA726FBE foreign key (voidBy_uuid) references user (uuid);