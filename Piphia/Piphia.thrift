exception EmptyOptionsGivenException {}

service Piphia {
    string MakePrediction(1: list<string> options) throws (1: EmptyOptionsGivenException ouch);
}