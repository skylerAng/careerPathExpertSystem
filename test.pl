
% -*- mode: Prolog  -*-
% (c) J. R. Fisher.
% http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/2_17.html

% Animal identification rules
% To run, type      go.

go :- hypothesize(Course),
       write('The suitable degree provided in Sunway University is: '),
       write(Course), nl, undo.

 /* hypotheses to be tested */
hypothesize(accountingAndFinance) :- accountingAndFinance, !.
hypothesize(actuarialStudies) :- actuarialStudies, !.
hypothesize(computerScience) :- computerScience, !.
hypothesize(informationSystems) :- informationSystems, !.
hypothesize(culinaryArts) :- culinaryArts, !.
hypothesize(audioTechnology) :- audioTechnology, !.
hypothesize(digitalFilmProduction) :- digitalFilmProduction, !.
hypothesize(nursing) :- nursing, !.
hypothesize(medicalBiotechnology) :- medicalBiotechnology, !.
hypothesize(biologyWithPsychology) :- biologyWithPsychology, !.
hypothesize(businessStudies) :- businessStudies, !.
hypothesize(businessManagement) :- businessManagement, !.
hypothesize(businessAdministration) :- businessAdministration, !.
hypothesize(hospitality) :- hospitality, !.
hypothesize(massCommunication) :- massCommunication, !.
hypothesize(unknown). /* no diagnosis */

/* career option identification rules */
accountingAndFinance :- mathematics, mentality,
                verify(handle_financial_data),
                verify(keeping_things_organized).

computerScience :- mathematics, mentality, creativeMentality,
                verify(sitting_in_front_of_the_computer),
                verify(keeping_things_organized).

actuarialStudies :- mathematics, mentality,
            verify(handle_financial_data),
            verify(good_at_making_analytical_decisions).

informationSystems :- mathematics, mentality, creativeMentality,
            verify(sitting_in_front_of_the_computer),
            verify(good_at_making_analytical_decisions).


culinaryArts :- artistic, creativeMentality,
               verify(love_to_eat),
               verify(love_to_cook).

audioTechnology :- artistic, creativeMentality,
             verify(humming_to_music),
             verify(enjoys_composing_music).
digitalFilmProduction :- artistic, creativeMentality,
              verify(good_storyboard_sense),
              verify(love_to_express_ideas).

nursing :- services, patience, attitude,
               verify(satisfaction_in_caring_for_sick_people).

medicalBiotechnology :- prospects, biology, patience, attitude,
               verify(desire_to_elimiate_pathogens),
               verify(interest_in_microorganisms).


biologyWithPsychology :- prospects, biology, patience, attitude,
                 verify(understanding_people),
                 verify(sharpens_insight_in_mental_people),
                 verify(appreciation_in_human_development).

businessStudies :- mentality, motivation, business, communication,
                   verify(being_a_jack_of_all_trades).

businessManagement :- mentality, motivation, business, communication,
                   verify(authority_and_control_is_your_thing).

businessAdministration :- mentality, motivation, business, communication,
                   verify(specialization_is_your_cup_of_tea).



hospitality :- services, patience, attitude, communication,
        verify(impress_customers),
        verify(love_putting_a_smile_on_others).

massCommunication :- services, attitude, communication,
        verify(entertaining_people_with_voice),
        verify(speaking_in_public).


/* classification rules */
mathematics :- verify(loves_calculations), !.
mathematics :- verify(able_to_think_logically).

services :- verify(do_you_like_to_care_for_others).

biology :- verify(does_the_human_body_intrigue_you),
        verify(are_you_interested_in_living_organisms).

patience :- verify(are_you_a_patient_person).

business :- verify(dreamt_about_being_an_entrepreneur), !.
business :- verify(making_money_is_priority).

communication :- verify(are_you_a_good_communicator).

attitude :- verify(are_you_fond_of_working_with_others),
        verify(helping_people_directly).

prospects :- verify(constant_improvement_and_fresh_findings),
           verify(stable_job).

mentality :- verify(love_to_solve_complex_problems), !.
mentality :- verify(do_you_tend_to_experiment_with_things).

creativeMentality :- verify(do_you_tend_to_take_things_apart), !.
creativeMentality :- verify(what_about_building_new_things),
                     verify(such_as_things_which_never_existed).

services :- verify(taking_care_of_people).

motivation :- verify(do_you_self_motivate), !.
motivation :- verify(taking_the_initiative).


artistic :- mathematics, verify(do_you_have_good_rhythm_sense), !.
artistic :- mathematics, verify(can_you_commit_to_your_own_craft).
/* how to ask questions */
ask(Question) :-
        write('Do you enjoy doing the following things?: '),
        write(Question), write('? '),
         read(Response), nl,
         ( (Response == yes ; Response == y)
         -> assert(yes(Question)) ;
         assert(no(Question)), fail).
:- dynamic yes/1,no/1.
/* How to verify something */
verify(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))).
/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.



















