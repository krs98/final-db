create table if not exists kid (
    dni        char(9)     not null,
    first_name varchar(20) not null,
    last_name  varchar(20),
    age        int         not null
);

create table if not exists app_user (
    username   varchar(20) not null,
    email      varchar(30),
    password   varchar(20) not null,
    first_name varchar(20),
    last_name  varchar(20),
    phone      char(9)
);

create table if not exists instructor (
    dni        char(9),
    first_name varchar(20) not null,
    last_name  varchar(20),
    phone      char(9),
    camp       int,
    activity   varchar(10)
);

create table if not exists camp (
    id          serial,
    camp_name   varchar(20) not null,
    kind        varchar(20) not null,
    description text,
    location    varchar(30),
    start_date  date,
    end_date    date,
    min_age     int,
    max_age     int
);

create table if not exists camp_lang (
    camp int,
    lang varchar(15)
);

create table if not exists booking (
    kid        char(9),
    user_email varchar(30) not null, 
    camp       int
);

create table if not exists activity (
    act_name    varchar(20),
    kind        varchar(20) not null,
    description text
);

-- PKs
alter table kid        add constraint kid_pk       primary key (dni);
alter table app_user   add constraint user_pk      primary key (email);
alter table instructor add constraint dni_pk       primary key (dni);
alter table camp       add constraint camp_pk      primary key (id);
alter table booking    add constraint booking_pk   primary key (kid, camp);
alter table activity   add constraint activity_pk  primary key (act_name);
alter table camp_lang  add constraint camp_lang_pk primary key (camp, lang);

-- FKs
alter table instructor
add constraint instructor_camp_fk
foreign key (camp) references camp(id);

alter table instructor
add constraint instructor_activity_fk 
foreign key (activity) references activity(act_name);

alter table camp_lang 
add constraint camp_lang_fk 
foreign key (camp) references camp(id);

alter table booking
add constraint booking_kid_fk
foreign key (kid) references kid(dni);

alter table booking
add constraint booking_camp_fk
foreign key (camp) references camp(id);