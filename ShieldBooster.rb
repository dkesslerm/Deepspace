#encoding: utf-8

module DeepSpace

    class SHieldBooster

        def initialize(n,b,u)
            @name=n
            @boost=b
            @uses=u
        end

        # Falta constructor de copia

        def boost
            @boost
        end

        def uses
            @uses
        end

        def useIt
            