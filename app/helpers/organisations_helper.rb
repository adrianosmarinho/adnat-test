module OrganisationsHelper

    # this will help to list all organisations when the user logs in
    def getAllOrganisations
        @organisations = Organisation.all
    end
end
